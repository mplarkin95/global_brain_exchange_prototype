class RecruitersController < ApplicationController

	def show
		@profile = Recruiter.find(params[:id])
		if user_signed_in?
			@owner = User.is_owner?(current_user,@profile)
		end
		if @owner
			@connections = current_user.friends 
		else
			@friendable = (current_user.meta_type != "Recruiter")
			@connected = current_user.friends_with?(@profile.user)
		end

	end

	
	def edit
		recruiter = Recruiter.find(params[:id])
		if user_signed_in? && User.is_owner?(current_user, recruiter)
			@recruiter = recruiter
		else
			redirect_to root_url
		end
	end

	def update
		if current_user.meta.update(recruiter_params)
			redirect_to root_url
		else
			flash[:danger] = "error"
			redirect_to root_url
		end

	end


	
	private
		def recruiter_params
			params.require(:recruiter).permit(:name, :bio)
		end
end

