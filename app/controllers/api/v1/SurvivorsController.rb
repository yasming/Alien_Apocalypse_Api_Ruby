module Api
	module V1
		class SurvivorsController < ApplicationController 
			
            def index
				survivors = Survivor.show_all
				render json: self.api_response(@success_message, @survivors_loaded, survivors),status: :ok

			end  
			
			def create
				survivor = Survivor.new(survivor_params)
				if survivor.save
					render json: self.api_response(@success_message, @survivor_saved, survivor)
				else
					render json: self.api_response(@error_message, @survivor_not_saved, survivor.errors),status: :unprocessable_entity
				end
			end

			def update
				survivor = Survivor.find(params[:id])
				if survivor.update_attributes(survivor_params_update)
					render json: self.api_response(@success_message, @survivor_updated, survivor),status: :ok
				else
					render json: self.api_response(@error_message, @survivor_not_updated, survivor.errors),status: :unprocessable_entity
				end
			end

			def flag
				survivor = Survivor.flagged(params[:id])
				render json: self.api_response(@success_message, @survivor_flagged, survivor),status: :ok
			end

			def reports
				reports = Survivor.statistics
				render json: self.api_response(@success_message, @survivor_percentage, reports),status: :ok
			end

			private
			def survivor_params
				params.permit(:name, :age, :gender, :latitude, :longitude)
			end

			private
			def survivor_params_update
				params.permit(:latitude, :longitude)
			end

		end
	end
end