# ArangoI18n

This gem lets you use the [ArangoDB](https://www.arangodb.com/)
multi-modal database as an I18n backend in your Ruby projects.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'arango_i18n'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install arango_i18n

## Usage

Using this gem with a Rails project might look something like this:

```ruby
# config/initializers/i18n_backend.rb

database = Ashikawa::Core::Database.new do |config|
  config.url = "http://localhost:8529"
  config.database_name = 'my_app_i18n'
  config.username = ""
  config.password = ""
end

# database.collection("i18n") will return a collection object
# The collection will be created if it does not exist
I18n.backend = I18n::Backend::KeyValue.new(ArangoI18n::Store.new(database.collection("i18n")))
```

If there are existing translations lurking in config/locales/\*.yml you
probably will want to load them in with this:

```
I18n.backend.load_translations
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

If you see something that can be improved, let me know.
Open an issue, or send a pull request.

1. Fork it ( https://github.com/sleepycat/arango_i18n/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
