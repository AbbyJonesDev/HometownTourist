require 'rails_helper'

RSpec.describe 'GET /v1/events/:id', :type => :request do
  it 'returns an event by :id' do
    event = create(:event)
    get "/v1/events/#{event.id}"

    expect(response.status).to eq 200
    expect(response.content_type).to eq("application/json")
    expect(response).to match_response_schema("event")

    expect(response_json).to eq (
      {
        'name' => event.name,
        'id' => event.id,
        'location' => event.location,
        'lat' => event.lat,
        'lon' => event.lon,
        'description' => event.description,
        'website' => event.website,
        'featured_image' => event.featured_image,
        'start_date' => event.start_date.as_json,
        'end_date' => event.end_date.as_json,
        'created_at' => event.created_at.as_json,
        'updated_at' => event.updated_at.as_json
      }
    )
  end
end