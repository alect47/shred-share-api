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

  it "user can get specific event", :vcr do
    event = create(:event, name: 'testing event', details: 'this is a test', id: 7)

    get "/api/v1/events/7"

    expect(response).to be_successful

    event = JSON.parse(response.body)

    expect(event["data"]["attributes"]['name']).to eq('testing event')
    expect(event["data"]["attributes"]['details']).to eq('this is a test')
  end

  it "invalid id", :vcr do
    event = create(:event, name: 'testing event', details: 'this is a test', id: 7)

    get "/api/v1/events/8"

    expect(response.status).to eq(404)

    results = JSON.parse(response.body, symbolize_names: true)

    expect(results[:errors]).to eq('invalid id')
  end

  it "user can post events", :vcr do
    event_info = '{"name": "new event", "details": "this is a test event"}'
    headers = {'Content-Type': 'application/json', 'Accept': 'application/json'}

    post "/api/v1/events", params: event_info, headers:headers

    expect(response).to be_successful

    events = JSON.parse(response.body)

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

  it "user can update event", :vcr do
    event = create(:event, name: 'testing event', details: 'this is a test', id: 7)

    headers = {'Content-Type': 'application/json', 'Accept': 'application/json'}
    event_info = '{"name": "change event", "details": "this is an update"}'

    patch "/api/v1/events/7", params: event_info, headers:headers

    expect(response).to be_successful

    event = JSON.parse(response.body)

    expect(event["data"]["attributes"]['name']).to eq('change event')
    expect(event["data"]["attributes"]['details']).to eq('this is an update')
  end
  it "sends error message if invalid id", :vcr do
    event = create(:event, name: 'testing event', details: 'this is a test', id: 7)

    headers = {'Content-Type': 'application/json', 'Accept': 'application/json'}
    event_info = '{"name": "change event", "details": "this is an update"}'

    patch "/api/v1/events/8", params: event_info, headers:headers

    expect(response.status).to eq(404)

    results = JSON.parse(response.body, symbolize_names: true)

    expect(results[:errors]).to eq('invalid id or poorly formatted request')
  end

  it "user can delete event", :vcr do
    event = create(:event, name: 'testing event', details: 'this is a test', id: 7)

    headers = {'Content-Type': 'application/json', 'Accept': 'application/json'}

    delete "/api/v1/events/7"

    expect(response.status).to eq(204)
  end

  it "invalid id for deleting event", :vcr do
    event = create(:event, name: 'testing event', details: 'this is a test', id: 7)

    headers = {'Content-Type': 'application/json', 'Accept': 'application/json'}

    delete "/api/v1/events/8"

    expect(response.status).to eq(404)

    results = JSON.parse(response.body, symbolize_names: true)

    expect(results[:errors]).to eq('invalid id or poorly formatted request')
  end
end
