require "rails_helper"

RSpec.describe "List of survivors", :type => :request do

  it "show a list of survivors" do

    get "/api/v1/survivors"
    expect(response).to  have_http_status(:success)
    response_body_json = JSON.parse(response.body)
    expect(response_body_json["status"]).to eq("SUCCESS")
    expect(response_body_json["message"]).to eq("Survivors loaded")


  end

  it "show reports of survivors" do

    get "/api/v1/survivors/reports"
    expect(response).to  have_http_status(:success)
    response_body_json = JSON.parse(response.body)
    expect(response_body_json["status"]).to eq("SUCCESS")
    expect(response_body_json["message"]).to eq("Percentage of abducted and non-abducted survivors")

  end
end