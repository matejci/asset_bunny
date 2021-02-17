# AssetBunny

Wrapper for [Bunny](https://github.com/ruby-amqp/bunny) gem. It is used to publish events/data between services using RabbitMQ.
It handles connections with RabbitMQ on its own, so you don't need to take care of that from your host app.
Include it in your Gemfile, and use it like described in `Usage` section.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'asset_bunny'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install asset_bunny

## Usage

```ruby
AssetBunny::Client.new.publish_data(event_name: 'audit_created',
                                    data: {'test': 'ok'},
                                    notification_type: ['email', 'web'],
                                    exchange_name: 'audit_service')
```

Currently there is only one RabbitMQ exchange (messaging is implemented only on Audit service), called 'audit_service' and it is default.
For now, `exchange_name` is optional parameter, and if it is not passed, it's value will be 'audit_service'.

### Configuration

Currently, gem doesn't need any special configuration, but in the future, if you need to pass some config params to a gem from the host app, you can do that
by creating initializer `../config/initializers/asset_bunny.rb` and using code similar to this:

```ruby
 AssetBunny.configure do |config|
   config.option = 'some option'
 end
```
### ENV vars

> RABBITMQ_HOST (if not found it will fallback to '127.0.0.1')
> RABBITMQ_PORT (if not found it will fallback to 5672)
> RABBITMQ_SSL  (if not found it will be 'false')
> RABBITMQ_USER (if not found it will be 'guest')
> RABBITMQ_PASS (if not found it will be 'guest')

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

