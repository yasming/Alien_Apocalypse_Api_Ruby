class ApplicationController < ActionController::API

	def api_response(status, message, data)
		{status: status, message: message, data: data}
	end

	before_action :set_variables
	def set_variables
		@success_message = "SUCCESS"
		@error_message = "ERROR"
		@survivors_loaded = "Survivors loaded"
		@survivor_saved = "Survivor saved"
		@survivor_not_saved = "Survivor not saved"
		@survivor_updated = "Survivor Updated"
		@survivor_not_updated = "Survivor not updated"
		@survivor_flagged = "Survivor flagged"
		@survivor_percentage = "Percentage of abducted and non-abducted survivors"
	end

end
