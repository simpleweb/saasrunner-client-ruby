module SaasRunner
  module Resource
    class Event
      attr_reader :client

      def initialize(client)
        @client = client
      end

      def index(params = {})
        response = client.get('/events', params)
        response.body
      end

      def show(id, params = {})
        response = client.get("/events/#{id}", params)
        response.body
      end

      def destroy!(id, params = {})
        response = client.delete("/events/#{id}", params)
        response.body
      end
    end
  end
end
