class ApplicationController < ActionController::API

    private
	def mount_reponse(status, message, data)
		return {status: status, message: message, data: data}
	end

end
