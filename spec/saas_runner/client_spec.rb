require 'spec_helper'

describe SaasRunner::Client, :vcr do
  let(:client) { SaasRunner::Client.new(api_key: "00b4040a-ed54-4524-a33e-f992298383cc") }

  describe "#initiialize" do
    it "should assign the API key" do
      expect(client.api_key).to eq "00b4040a-ed54-4524-a33e-f992298383cc"
    end
    it "should get the correct API host" do
      expect(client.api_host).to eq "api.saasrunner.com"
    end
  end
end
