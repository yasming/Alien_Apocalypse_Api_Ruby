require "rails_helper"

RSpec.describe "Create survivors", :type => :request do
    
    it "create survivors" do
        post "/api/v1/survivors", :params => { :name => "name", :gender => 0 , :age => 32, :latitude => 32, :longitude => 51}
        expect(response).to  have_http_status(:success)
    end
end