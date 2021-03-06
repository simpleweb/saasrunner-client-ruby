# SaasRunner

[![Build Status](https://travis-ci.org/simpleweb/saasrunner-client-ruby.svg?branch=master)](https://travis-ci.org/simpleweb/saasrunner-client-ruby)

Ruby client library for the SaaS Runner REST API

## Installation

Add this line to your application's Gemfile:

    gem 'saas_runner'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install saas_runner

## Usage

Refer to the [SaaS Runner API docs](http://docs.saasrunner.apiary.io/) for more information on the API.

First create a new client object with your SaaS Runner API key

```ruby
client = SaasRunner::Client.new(api_key: 'YOUR API KEY')
```

And then call the relevant resource

### Subscribers

Create a new subscriber

```ruby
client.subscribers.create!(subscriber_uid: 'ABC123')
```

### Transactions

Create a new transaction charge using the three digit letter code for the currency (eg USD or GBP)

```ruby
client.transactions.charge!(subscriber_uid: 'ABC123', transaction_uid: '123', amount_in_cents: 1000, currency: 'USD')
```

Create a new transaction refund

```ruby
client.transactions.refund!(subscriber_uid: 'ABC123', transaction_uid: '124', amount_in_cents: 150, currecny: 'USD')
```

### Activations

```ruby
client.activations.create!(subscriber_uid: 'ABC123')
```

### Events

List all events

```ruby
client.events.index
```

List a single event

```ruby
client.events.show(568)
```

Delete an event

```ruby
client.events.destroy!(568)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
