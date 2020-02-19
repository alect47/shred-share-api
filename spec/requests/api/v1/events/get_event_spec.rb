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

  it "user can post events", :vcr do
    event_info = '{"name": "new event", "details": "this is a test event"}'
    headers = {'Content-Type': 'application/json', 'Accept': 'application/json'}

    post "/api/v1/events", params: event_info, headers:headers

    expect(response).to be_successful

    events = JSON.parse(response.body)
    # binding.pry
    expect(events["data"]["attributes"]['name']).to eq('new event')
    expect(events["data"]["attributes"]['details']).to eq('this is a test event')
  end

  it "user must post with name", :vcr do
    headers = {'Content-Type': 'application/json', 'Accept': 'application/json'}

    post "/api/v1/events", headers:headers

    expect(response.status).to eq(401)

    results = JSON.parse(response.body, symbolize_names: true)
    
    expect(results[:errors]).to eq('missing name')
  end
end
