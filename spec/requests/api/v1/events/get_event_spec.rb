require 'rails_helper'

describe "event api" do
  it "user can get events", :vcr do
    get "/api/v1/events"

    expect(response).to be_successful

    events = JSON.parse(response.body)

    expect(events["data"]["attributes"]).to eq(39.7392358)
  end
end
