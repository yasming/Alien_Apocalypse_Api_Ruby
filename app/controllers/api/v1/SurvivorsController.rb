module Api
	module V1
        class SurvivorsController < ApplicationController 
            def index
				articles = Survivor.order('created_at DESC');
				render json: {status: 'SUCCESS', message:'Artigos carregados', data:articles},status: :ok
			end  
		end
	end
end