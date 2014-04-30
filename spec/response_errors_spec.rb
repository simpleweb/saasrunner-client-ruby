require 'spec_helper'

describe SaasRunner::ResponseError do
  let(:params) { ({body: 'Something went wrong', status: '500', method: 'post', url: 'http://example.org/test'}) }
  it 'should have correct response' do
    ex = SaasRunner::ResponseError.new(params).to_s
    expect(ex).to eq("500 POST http://example.org/test | Errors: Something went wrong")
  end
  let(:body) { [Hashie::Mash.new({"field" => "subscriber_uid", "message" => "can't be blank"}), Hashie::Mash.new({"field" => "transaction_uid", "message" => "can't be blank"})] }
  let(:params2) { ({body: body, status: '422', method: 'post', url: 'http://example.com/test'}) }
  it 'should report multiple errors if present' do
  	ex = SaasRunner::ResponseError.new(params2).to_s
  	expect(ex).to eq("422 POST http://example.com/test | Errors: subscriber_uid can't be blank, transaction_uid can't be blank")
  end
end



