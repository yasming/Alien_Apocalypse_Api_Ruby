require "rails_helper"

RSpec.describe "Edit survivors location", :type => :request do

  it "edit survivors location" do

    put "/api/v1/survivors/1", :params => {:latitude => 32, :longitude => 51}
    expect(response).to  have_http_status(:success)
    survivor = Survivor.find(1).as_json
    response_body_json = JSON.parse(response.body)
    expect(response_body_json["status"]).to eq("SUCCESS")
    expect(response_body_json["message"]).to eq("Survivor Updated")
    expect(response_body_json["data"]).to eq(survivor)

  end

end