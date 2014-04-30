require 'spec_helper'

describe SaasRunner::Client, :vcr do
  let(:client) { SaasRunner::Client.new(api_key: "00b4040a-ed54-4524-a33e-f992298383cc") }
  let(:subscriber_uid) { "sub#{Time.now.to_i}" }
  	 

  describe "subscribers" do
    it "should add a subscriber" do
      resource = client.subscribers
      resource.create!(subscriber_uid: subscriber_uid)
  	  expect(resource.response.status).to eq(201)  	
  	end
  end
end


