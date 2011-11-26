require 'omniauth/strategies/oauth2'
require 'xmlsimple'

module OmniAuth
  module Strategies

    # Authenticate to Yandex.ru utilizing OAuth 2.0
    # http://api.yandex.ru/oauth/

    class Yandex < OmniAuth::Strategies::OAuth2
      option :name, "yandex"

      option :client_options, {
        :site => 'https://oauth.yandex.ru/',
        :token_url     => '/token',
        :authorize_url => '/authorize'
      }

      uid do
        raw_info[:uid]
      end

      info do
        {
          :nickname => raw_info[:name],
          :email => raw_info[:email],
          :name => raw_info[:name],
          :image => raw_info[:photo],
          :location => raw_info[:country],
          :urls => {
            'Yandex' => raw_info[:yaru_profile]
          }
        }
      end

      extra do
        {:raw_info => raw_info}
      end

      def callback_url
        if options.authorize_options.respond_to? :callback_url
          options.authorize_options.callback_url
        else
          super
        end
      end

      private

      def raw_info
        @raw_info ||= begin
          # Get user info from Ya.ru API
          # http://api.yandex.ru/yaru/doc/ref/concepts/discovery.xml
          xml_data = access_token.get("https://api-yaru.yandex.ru/me/").body
          data = XmlSimple.xml_in(xml_data)
          {
            :uid => data["id"][0],
            :yaru_profile => data["link"][0]["href"],
            :photo => data["link"][2]["href"],
            :name => data["name"][0],
            :email => data["email"][0],
            :country => data["country"][0],
            :city => data["city"][0],
            :sex => data["sex"][0],
            :skype => data["skype"][0]
          }
        end
      end

    end
  end
end
