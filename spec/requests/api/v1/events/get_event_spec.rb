require 'rails_helper'

describe "event api" do
  it "user can get events", :vcr do
    create_list(:event, 3)

    get "/api/v1/events"

    expect(response).to be_successful

    events = JSON.parse(response.body)
    
    expect(events["data"][0]["attributes"]['name']).to eq('MyString')
    expect(events["data"].count).to eq(3)
  end
end
