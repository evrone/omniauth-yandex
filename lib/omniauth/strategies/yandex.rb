require 'omniauth/strategies/oauth2'
require 'json'

module OmniAuth
  module Strategies

    # Authenticate to Yandex.ru utilizing OAuth 2.0
    # https://tech.yandex.com/oauth/

    class Yandex < OmniAuth::Strategies::OAuth2
      option :name, "yandex"

      option :client_options, {
        :site => 'https://oauth.yandex.ru/',
        :token_url     => '/token',
        :authorize_url => '/authorize'
      }

      uid { raw_info['id'] }

      extra do
        prune!({:raw_info => raw_info})
      end

      info do
        prune!({
          'nickname' => raw_info['display_name'],
          'email'  => raw_info['default_email'],
          'name' => raw_info['real_name']
        })
      end

      def callback_url
        if options.authorize_options.respond_to? :callback_url
          options.authorize_options.callback_url
        else
          super
        end
      end

      private

      def prune!(hash)
        hash.delete_if do |_, value|
          prune!(value) if value.is_a?(Hash)
          value.nil? || (value.respond_to?(:empty?) && value.empty?)
        end
      end

      def raw_info
        @raw_info ||= begin
          # Get user info from Yandex.login API
          JSON.parse access_token.get("https://login.yandex.ru/info?format=json").body
        end
      end
    end
  end
end
