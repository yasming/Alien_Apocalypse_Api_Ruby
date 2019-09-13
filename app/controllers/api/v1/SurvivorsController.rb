module Api
	module V1
		class SurvivorsController < ApplicationController 
			
            def index
				survivors = Survivor.listAllSurvivorsWithTheirSituation
				render json: {status: 'SUCCESS', message:'Survivors loaded', data:survivors}
			end  
			
			def create
				survivor = Survivor.new(survivor_params)
				if survivor.save
					render json: {status: 'SUCCESS', message:'Saved survivor', data:survivor},status: :ok
				else
					render json: {status: 'ERROR', message:'Survivor not saved', data:survivor.errors},status: :unprocessable_entity
				end
			end

			def update
				survivor = Survivor.find(params[:id])
				if survivor.update_attributes(survivor_params)
					render json: {status: 'SUCCESS', message:'Updated survivor', data:survivor},status: :ok
				else
					render json: {status: 'ERROR', message:'Survivors not update', data:survivor.erros},status: :unprocessable_entity
				end
			end

			def flag
				survivor = Survivor.find(params[:id])
				survivor.flag = survivor.flag + 1
				survivor.save
				render json: {status: 'SUCCESS', message:'Survivor flagged', data:survivor},status: :ok
			end

			def reports
				query = 'SELECT (count(*)-COUNT( case when flag >=3  then 1 else null end))*100/Count(*) AS "non-abducted", COUNT( case when flag >=3  then 1 else null end)*100/count(*) AS abducted FROM public.survivors;'
				survivors = ActiveRecord::Base.connection.execute(query)
				render json: {status: 'SUCCESS', message:'Percentage of abducted and non-abducted survivors', data:survivors},status: :ok
			end

			private
			def survivor_params
				params.permit(:name, :age, :gender, :latitude, :longitude)
			end

		end
	end
end