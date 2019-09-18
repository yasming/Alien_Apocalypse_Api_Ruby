require "rails_helper"

RSpec.describe "Create survivors", :type => :request do
    
    it "create survivors" do
        post "/api/v1/survivors", :params => { :name => "name", :gender => 0 , :age => 32, :latitude => 32, :longitude => 51}
        expect(response).to  have_http_status(:success)
        response_body_json = JSON.parse(response.body)
        expect(response_body_json["status"]).to eq("SUCCESS")
        # expect(json_body["data"]["attributes"]["name"]).to eq(user.name)
    end

    it "create survivors without gender" do

        post "/api/v1/survivors", :params => { :name => "name" , :age => 32, :latitude => 32, :longitude => 51}
        expect(response).to  have_http_status(422)

    end

    it "create survivors without name" do

        post "/api/v1/survivors", :params => { :gender => 0 , :age => 32, :latitude => 32, :longitude => 51}
        expect(response).to  have_http_status(422)

    end

    it "create survivors without age" do

        post "/api/v1/survivors", :params => { :name => "name" , :gender => 0, :latitude => 32, :longitude => 51}
        expect(response).to  have_http_status(422)

    end

    it "create survivors without latitude" do

        post "/api/v1/survivors", :params => { :name => "name" , :gender => 0, :age => 32, :longitude => 51}
        expect(response).to  have_http_status(422)

    end

    it "create survivors without longitude" do

        post "/api/v1/survivors", :params => { :name => "name" , :gender => 0, :age => 32, :latitude => 32}
        expect(response).to  have_http_status(422)

    end

    it "create survivors without longitude" do

        post "/api/v1/survivors", :params => { :name => "name" , :gender => 0, :age => 32, :latitude => 32}
        expect(response).to  have_http_status(422)

    end
end