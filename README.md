# Yandex OAuth strategy for OmniAuth

This gem contains the unofficial Yandex OAuth2 strategy for [OmniAuth](http://github.com/intridea/omniauth).

## Installation

    gem "omniauth-yandex"
    
Also, you have to obtain API key for your app at Yandex [OAuth app registration page](https://oauth.yandex.ru/client/new)

## Basic Usage

    use OmniAuth::Builder do
      provider :yandex, ENV['YANDEX_KEY'], ENV['YANDEX_PRIVATE_KEY']
    end


## Links

* http://api.yandex.ru/oauth/

## License

Copyright (c) 2011 by Kirill Shatrov, [Evrone.com](http://evrone.com/)
