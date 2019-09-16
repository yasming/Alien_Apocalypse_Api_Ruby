require "rails_helper"

RSpec.describe "List of survivors", :type => :request do

  it "show a list of survivors" do

    get "/api/v1/survivors"
    expect(response).to  have_http_status(:success)

  end

  it "show reports of survivors" do

    get "/api/v1/survivors/reports"
    expect(response).to  have_http_status(:success)

  end
end