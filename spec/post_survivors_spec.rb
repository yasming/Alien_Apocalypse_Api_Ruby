require "rails_helper"

RSpec.describe "Create survivors", :type => :request do
    
    it "create survivors" do

        post "/api/v1/survivors", :params => { :name => "name", :gender => 0 , :age => 32, :latitude => 32, :longitude => 51}
        survivor = Survivor.last.as_json
        expect(response).to  have_http_status(:success)
        response_body_json = JSON.parse(response.body)
        expect(response_body_json["status"]).to eq("SUCCESS")
        expect(response_body_json["message"]).to eq("Survivor saved")
        expect(response_body_json["data"]).to eq(survivor)

    end

    it "create survivors without gender" do

        post "/api/v1/survivors", :params => { :name => "name" , :age => 32, :latitude => 32, :longitude => 51}
        expect(response).to  have_http_status(422)
        response_body_json = JSON.parse(response.body)
        expect(response_body_json["status"]).to eq("ERROR")
        expect(response_body_json["message"]).to eq("Survivor not saved")
        expect(response_body_json["data"]["gender"]).to eq(["can't be blank"])

    end

    it "create survivors without name" do

        post "/api/v1/survivors", :params => { :gender => 0 , :age => 32, :latitude => 32, :longitude => 51}
        expect(response).to  have_http_status(422)
        response_body_json = JSON.parse(response.body)
        expect(response_body_json["status"]).to eq("ERROR")
        expect(response_body_json["message"]).to eq("Survivor not saved")
        expect(response_body_json["data"]["name"]).to eq(["can't be blank"])

    end

    it "create survivors without age" do

        post "/api/v1/survivors", :params => { :name => "name" , :gender => 0, :latitude => 32, :longitude => 51}
        expect(response).to  have_http_status(422)
        response_body_json = JSON.parse(response.body)
        expect(response_body_json["status"]).to eq("ERROR")
        expect(response_body_json["message"]).to eq("Survivor not saved")
        expect(response_body_json["data"]["age"]).to eq(["can't be blank"])

    end

    it "create survivors without latitude" do

        post "/api/v1/survivors", :params => { :name => "name" , :gender => 0, :age => 32, :longitude => 51}
        expect(response).to  have_http_status(422)
        response_body_json = JSON.parse(response.body)
        expect(response_body_json["status"]).to eq("ERROR")
        expect(response_body_json["message"]).to eq("Survivor not saved")
        expect(response_body_json["data"]["latitude"]).to eq(["can't be blank"])

    end

    it "create survivors without longitude" do

        post "/api/v1/survivors", :params => { :name => "name" , :gender => 0, :age => 32, :latitude => 32}
        expect(response).to  have_http_status(422)
        response_body_json = JSON.parse(response.body)
        expect(response_body_json["status"]).to eq("ERROR")
        expect(response_body_json["message"]).to eq("Survivor not saved")


    end

    it "create survivors without longitude" do

        post "/api/v1/survivors", :params => { :name => "name" , :gender => 0, :age => 32, :latitude => 32}
        expect(response).to  have_http_status(422)
        response_body_json = JSON.parse(response.body)
        expect(response_body_json["status"]).to eq("ERROR")
        expect(response_body_json["message"]).to eq("Survivor not saved")
        expect(response_body_json["data"]["longitude"]).to eq(["can't be blank"])

    end
end