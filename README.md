# OmniAuth Yandex.ru

This gem contains the unofficial Yandex.ru OAuth2 strategy for [OmniAuth](http://github.com/intridea/omniauth).

## Installation

    gem "omniauth-vkontakte"
    

## Basic Usage

    use OmniAuth::Builder do
      provider :yandex, ENV['YANDEX_KEY'], ENV['YANDEX_PRIVATE_KEY']
    end


## Links

* http://api.yandex.ru/oauth/

## License

Copyright (c) 2011 by Kirill Shatrov
