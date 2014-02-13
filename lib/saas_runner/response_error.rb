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
      msg = "#{status} #{method} #{url}"

      errors.map(&:to_s).join(', ') if errors.kind_of?(Array)
      msg = "#{msg} | Errors: #{errors.to_s}"

      msg
    end

    def errors
      return body if body.kind_of?(String)

      messages = []

      # Convert hash to array and fetch first (and only) pair of elements
      parts = body.to_a[0]

      # Fetch key and resource
      key, resource = parts

      # Fetch errors
      errors = resource.errors

      errors.each do |error|
        messages.push "#{error.field} #{error.message}"
      end

      messages.join(', ')
    end
  end
end
