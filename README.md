# Rack::BodyClasses

Decorate your `<body>` with CSS Classes indicating platform, browser, browser version, and more.

## Project Status

- Build: [![Build Status](https://secure.travis-ci.org/xentek/rack-body_classes.png)](http://travis-ci.org/xentek/rack-body_classes)
- Dependencies: [![Dependency Status](https://gemnasium.com/xentek/rack-body_classes.png)](https://gemnasium.com/xentek/rack-body_classes)
- Code Quality: [![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/xentek/rack-body_classes)

## Installation

Add this line to your application's Gemfile:

    gem 'rack-body_classes'

And then execute:

    $ bundle

## Usage

First, add the middlware to your application...

#### Rack/Sinatra

    use Rack::BodyClasses

#### Rails

    config.middleware.use Rack::BodyClasses


Then, in your layout, output `env['rack.body_classes']` in your `<body>` tag's `class` attribute.

Here's a trivial layout file, formatted with the `slim` templating engine, to give you an example:

    html
      head
      body class="#{env['rack.body_classes']}"
        == yield

    
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
