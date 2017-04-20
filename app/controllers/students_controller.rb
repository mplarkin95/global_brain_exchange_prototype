class StudentsController < ApplicationController

	def edit
		if user_signed_in? && User.is_owner?(current_user.id,"Student",params[:id])
			@recruiter = Recruiter.find(params[:id])
		else
			redirect_to root_url
		end

end
