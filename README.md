# Yandex OAuth strategy for OmniAuth

This gem contains the unofficial Yandex OAuth2 strategy for [OmniAuth](http://github.com/intridea/omniauth).

## Installation

    gem "omniauth-yandex"

You have to obtain API key for your app at Yandex [OAuth app registration page](https://oauth.yandex.ru/client/new)

**Don't forget to check these checkboxes like on the screenshot:**

![](http://f.cl.ly/items/3A093X3E420k2Q3P0K2A/Screen%20Shot%202012-10-21%20at%2010.12.13%20PM.png)

## Basic Usage

    use OmniAuth::Builder do
      provider :yandex, ENV['YANDEX_KEY'], ENV['YANDEX_PRIVATE_KEY']
    end


## Links

* https://tech.yandex.com/oauth/

## License

Copyright (c) 2011 by Kirill Shatrov, [Evrone.com](http://evrone.com/)
