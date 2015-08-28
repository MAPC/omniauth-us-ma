# This README is not implemented at all, we just want to have a statement of intention / README-driven development. We will remove this method when the gem is ready to use.

---

# OmniAuth US-MA

[![Gem Version](https://badge.fury.io/rb/omniauth-us-ma.svg)](http://badge.fury.io/rb/omniauth-us-ma)
[![CI Build Status](https://secure.travis-ci.org/mapc/omniauth-us-ma.svg?branch=master)](http://travis-ci.org/mapc/omniauth-us-ma)
[![Code Climate](https://codeclimate.com/github/mapc/omniauth-us-ma.png)](https://codeclimate.com/github/mapc/omniauth-us-ma)

This gem contains the Commonwealth of Massachusetts strategy for OmniAuth. Use this gem in your Ruby web application to log in users who are employed with the Commonwealth of Massachusetts.

This gem is maintained by the [Metropolitan Area Planning Council (MAPC)](https://github.com/mapc). The Commonwealth of Massachusetts Information Technology Division (MassITD or MassIT) maintains the server.

> TODO: Integration methods and documentation on the OAuth flow.

## Before You Begin

You should have already installed OmniAuth into your app; if not, read the [OmniAuth README](https://github.com/intridea/omniauth) to get started.

> TODO: How to get a client credentials (Client ID and Client Secret)

## Using This Strategy

First start by adding this gem to your Gemfile:

```ruby
gem 'omniauth-us-ma'
```

If you need to use the latest HEAD version, you can do so with:

```ruby
gem 'omniauth-us-ma', :github => 'mapc/omniauth-us-ma'
```

Next, tell OmniAuth about this provider. For a Rails app, your `config/initializers/omniauth.rb` file should look like this:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :us_ma, ENV["US_MA_KEY"], ENV["US_MA_SECRET"]
end
```

Ensure that `US_MA_KEY` and `US_MA_SECRET` are set as environment variables in your `.env` file (with [Foreman](https://github.com/ddollar/foreman/) or [Dotenv](https://github.com/bkeepers/dotenv)), in your shell, and/or in your deployment configuration. Set them with the appropriate values you obtained [earlier](#before-you-begin).

## Authentication Options

> TODO: Supported authentication options

> This section might read: MassIT supports a [few options](TODO) when authenticating. Usually you would specify these options as query parameters to the MassIT API authentication url (`https://api.massit.gov/oauth/authenticate` by default). With OmniAuth, of course, you use `http://yourapp.com/auth/us_ma` instead. Because of this, this OmniAuth provider will pick up the query parameters you pass to the `/auth/us_ma` URL and re-use them when making the call to the MassIT API.

You can configure several options, which you pass in to the `provider` method via a `Hash`:


Option name | Default | Explanation
--- | --- | ---
`option_name` | `default` | What this option does, and links to further documentation

> TODO: Examples in using options

For example, to request `option`, `other_option` and `last_option` permissions and display the authentication page in a popup window:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :us_ma, ENV['US_MA_KEY'], ENV['US_MA_SECRET'],
           scope: 'option,other_option,last_option', display: 'popup'
end
```

### Per-Request Options

If you want to set the `display` format or `todo_option` on a per-request basis, you can just pass it to the OmniAuth request phase URL, for example: `/auth/us_ma?display=popup` or `/auth/us_ma?todo_option=todo_value`.

## Auth Hash

Here's an example *Auth Hash* available in `request.env['omniauth.auth']`:

```ruby
{
  :provider => 'us_ma',
  :uid => '1234567',
  :info => {
    :nickname => 'Matt',
    :email => 'matt.cloyd@state.ma.us',
    :name => 'Matt Cloyd',
    :first_name => 'Matt',
    :last_name => 'Cloyd',
    :image => 'http://graph.massit.com/1234567/picture?type=square',
    :urls => { :linked_in => 'https://www.linkedin.com/pub/matt-cloyd/23/440/607' },
    :location => 'Boston, Massachusetts',
    :verified => true
  },
  :credentials => {
    :token => 'ABCDEF...', # OAuth 2.0 access_token, which you may wish to store
    :expires_at => 1321747205, # when the access token expires (it always will)
    :expires => true # this will always be true
  },
  :extra => {
    :raw_info => {
      :id => '1234567',
      :name => 'Matt Cloyd',
      :first_name => 'Matt',
      :last_name => 'Cloyd',
      :link => 'http://www.massit.com/mcloyd',
      :username => 'matt.cloyd',
      :location => { :id => '123456789', :name => 'Boston, Massachusetts' },
      :gender => 'male',
      :email => 'matt.cloyd@state.ma.us',
      :timezone => -5,
      :locale => 'en_US',
      :verified => true,
      :updated_time => '2015-08-28T12:23:03+0000'
    }
  }
}
```

The precise information available may depend on the permissions which you request.

## Watch the RailsCast

Ryan Bates has put together an excellent RailsCast on OmniAuth:

[![RailsCast #241](http://railscasts.com/static/episodes/stills/241-simple-omniauth-revised.png "RailsCast #241 - Simple OmniAuth (revised)")](http://railscasts.com/episodes/241-simple-omniauth-revised)

## Supported Rubies

OmniAuth US MA is tested under 1.9.3, 2.0.0, 2.1.5, 2.2.0, JRuby, and Rubinius.

## Contributing

Please read the [contribution guidelines](CONTRIBUTING.md) for some information on how to get started. No contribution is too small.

## License

Copyright (c) 2015 by Metropolitan Area Planning Council

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
