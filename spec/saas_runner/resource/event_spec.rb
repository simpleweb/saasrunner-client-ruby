require 'spec_helper'

describe SaasRunner::Client, :vcr do
  let(:client) { SaasRunner::Client.new(api_key: "00b4040a-ed54-4524-a33e-f992298383cc") }

  describe "events" do
    let(:resource) { client.events }
    it "should show all events" do
      resource.index
      expect(resource.response.status).to eq(200)
    end
    it "should get a single event" do
      event = client.subscribers.create!(subscriber_uid: "event#{Time.now.to_i}")
      resource.show(event.id)
      expect(resource.response.status).to eq(200)
    end
    it "should delete a requested event" do
      event = client.subscribers.create!(subscriber_uid: "event#{Time.now.to_i + 1}")
      resource.destroy!(event.subscriber.id)
      expect(resource.response.status).to eq(204)
    end
  end
end
