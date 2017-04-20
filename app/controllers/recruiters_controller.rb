class RecruitersController < ApplicationController


	def edit
		if user_signed_in? && User.is_owner?(current_user.id,"Recruiter",params[:id])
			@recruiter = Recruiter.find(params[:id])
		else
			redirect_to root_url
		end

	end


	


end
