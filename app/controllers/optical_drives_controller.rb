class OpticalDrivesController < ParentProductController
	def show
		@optical_drive = OpticalDrive.find(params[:id])
	end

end

