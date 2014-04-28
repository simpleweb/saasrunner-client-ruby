# SaasRunner

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'saas_runner'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install saas_runner

## Usage

Create a new client

```ruby
client = SaasRunner::Client.new(api_key: 'YOUR API KEY')
```

### Subscribers

```ruby
client.subscribers.create!(subscriber_uid: 'ABC123')
```

### Transactions

```ruby
client.transactions.charge!(subscriber_uid: 'ABC123', amount_in_cents: 1000)
client.transactions.refund!(subscriber_uid: 'ABC123', amount_in_cents: 150)
```

### Events

```ruby
client.events.index
client.events.show(568)
client.events.desttoy!(568)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
