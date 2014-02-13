module SaasRunner
  module Resource
    class Subscriber
      attr_reader :client

      def initialize(client)
        @client = client
      end

      def create!(params = {})
        response = client.post('/subscribers', { subscriber: params })
        response.body
      end
    end
  end
end
