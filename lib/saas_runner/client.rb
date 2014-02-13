module SaasRunner
  class Client
    attr_reader :api_key, :api_host

    def initialize(options = {})
      @api_key = options.fetch(:api_key)
      @api_host = options.fetch(:api_host, 'api.saasrunner.com')
    end

    # Public: Access the subscribers resource
    #
    # Returns a Resource::Subscriber
    def subscribers
      @subscribers ||= Resource::Subscriber.new(self)
    end

    def transactions
      @transactions ||= Resource::Transaction.new(self)
    end

    def events
      @events ||= Resource::Event.new(self)
    end

    def get(path, params)
      request(:get, path, params)
    end

    def post(path, body)
      request(:post, path, {}, body)
    end

    def delete(path, params)
      request(:delete, path, params)
    end

    private

    def request(method, path, params = {}, body = {})
      connection.send(method) do |request|
        request.headers['X-API-Key'] = api_key
        request.params = params
        request.body = body

        request.url(path)
      end
    end

    def connection
      @connection ||= Faraday.new(url: "http://#{api_host}") do |builder|
        builder.request :url_encoded

        builder.use Faraday::Response::RaiseResponseError

        builder.use FaradayMiddleware::Mashify
        builder.use FaradayMiddleware::ParseJson, content_type: /\bjson$/

        builder.adapter :net_http
      end
    end
  end
end
