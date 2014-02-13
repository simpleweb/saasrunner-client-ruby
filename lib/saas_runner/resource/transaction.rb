module SaasRunner
  module Resource
    class Transaction
      attr_reader :client

      def initialize(client)
        @client = client
      end

      def charge!(params = {})
        response = client.post('/transactions/charge', { transaction: params })
        response.body
      end

      def refund!(params = {})
        response = client.post('/transactions/refund', { transaction: params })
        response.body
      end
    end
  end
end
