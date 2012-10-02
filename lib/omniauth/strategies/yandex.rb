require 'omniauth/strategies/oauth2'
require 'json'

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

      uid { raw_info['id'] }

      extra do
        {:raw_info => raw_info}
      end

      info do
        {'nickname' => raw_info['display_name'],
        'email'  => raw_info['default_email'],
        'name' => raw_info['real_name']
        }.delete_if{ |_,v| v.nil?||v.respond_to?(:empty?)&&v.empty? }
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
          # Get user info from Yandex.login API
          JSON.parse access_token.get("https://login.yandex.ru/info?format=json").body
        end
      end
    end
  end
end
