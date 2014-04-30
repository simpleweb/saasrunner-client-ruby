require 'spec_helper'

describe SaasRunner::Client, :vcr do
  let(:client) { SaasRunner::Client.new(api_key: "00b4040a-ed54-4524-a33e-f992298383cc") }
  let(:subscriber_uid) { "sub#{Time.now.to_i}" }
  let(:transaction_uid) { "#{Time.now.to_i}" }
  let(:transaction_uid2) { "#{Time.now.to_i + 1}" }

  describe "#initiialize" do
    it "should assign the API key" do
      expect(client.api_key).to eq "00b4040a-ed54-4524-a33e-f992298383cc"
    end
  end
  describe "subscribers" do
    it "should add a subscriber" do
      resource = client.subscribers
      resource.create!(subscriber_uid: subscriber_uid)
      expect(resource.response.status).to eq(201)
    end
  end
  describe "transactions" do
    let(:params) { ({ subscriber_uid: subscriber_uid, amount_in_cents: 1000, currency: "USD", transaction_uid: transactionuid} ) }
    let(:resource) { client.transactions }
    it "should charge a transaction" do
      resource.charge!(params)
      expect(resource.response.status).to eq(201)
    end
    let(:params) { ({subscriber_uid: subscriber_uid, amount_in_cents: 1000, currency: "USD", transaction_uid: transaction_uid2} )}
    it "should refund a transaction" do
      resource.refund!(params)
      expect(resource.response.status).to eq(201)
    end
  end

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
