module SaasRunner
  class ResponseError < StandardError
    attr_reader :response, :body, :status, :method, :url

    def initialize(response = nil)
      @response = response

      @body = response[:body]
      @status = response[:status].to_i
      @method = response[:method].to_s.upcase
      @url = response[:url]

      super
    end

    def to_s
      "#{status} #{method} #{url} | Errors: #{errors}"
    end

    private

    def errors
      return body if body.kind_of?(String) 

      messages = []

      body.each do |error|
        messages.push "#{error.field} #{error.message}"
      end

      messages.join(', ')
    end
  end
end
