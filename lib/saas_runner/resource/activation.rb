module SaasRunner
  module Resource
    class Activation
      attr_reader :client

      def initialize(client)
        @client = client
      end

      def create!(params = {})
        response = client.post('/activations', { activation: params })
        response.body
      end
    end
  end
end
