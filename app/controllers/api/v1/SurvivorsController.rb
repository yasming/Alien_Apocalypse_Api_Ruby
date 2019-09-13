module Api
	module V1
		class SurvivorsController < ApplicationController 
			
            def index
				survivors = Survivor.display_all
				# survivors = Survivor.listAllSurvivorsWithTheirSituation
				render json: self.api_response('SUCCESS', 'Survivors loaded', survivors),status: :ok

			end  
			
			def create
				survivor = Survivor.new(survivor_params)
				if survivor.save
					render json: self.api_response('SUCCESS', 'Survivor saved', survivor)
				else
					render json: self.api_response('ERROR', 'Survivor not saved', survivor.errors),status: :unprocessable_entity
				end
			end

			def update
				survivor = Survivor.find(params[:id])
				if survivor.update_attributes(survivor_params)
					render json: self.api_response('SUCCESS', 'Survivor Updated', survivor),status: :ok
				else
					render json: self.api_response('ERROR', 'Survivor not update', survivor.errors),status: :unprocessable_entity
				end
			end

			def flag
				survivor = Survivor.find(params[:id])
				survivor.flag = survivor.flag + 1
				survivor.save
				render json: self.api_response('SUCCESS', 'Survivor flagged', survivor),status: :ok
			end

			def reports
				reports = Survivor.statistics
				render json: self.api_response('SUCCESS', 'Percentage of abducted and non-abducted survivors', reports),status: :ok
			end

			private
			def survivor_params
				params.permit(:name, :age, :gender, :latitude, :longitude)
			end

		end
	end
end