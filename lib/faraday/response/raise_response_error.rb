require 'faraday'
require 'saas_runner/response_error'

module Faraday
  class Response::RaiseResponseError < Response::Middleware
    def on_complete(env)
      status = env[:status].to_i

      if (400..599).include?(status)
        raise SaasRunner::ResponseError.new(env)
      end
    end
  end
end
