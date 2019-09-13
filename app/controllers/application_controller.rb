class ApplicationController < ActionController::API

	def api_response(status, message, data)
		{status: status, message: message, data: data}
	end

end
