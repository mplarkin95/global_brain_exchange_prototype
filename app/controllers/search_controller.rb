class SearchController < ApplicationController

	def index
		if user_signed_in?
			@view_type = current_user.meta_type 
			@users = User.where.not(meta_type: current_user.meta_type)
			if @view_type == "Recruiter"
				@users = student_search(@users,params[:name],params[:gpa])
			else
				@users = recruiter_search(@users,params[:name])
			end

		else
			@users = User.all
		end
	end

	private

	def recruiter_search(users, r_name)
		return users.joins(:recruiter).where(["recruiters.name LIKE ?", "%#{r_name}%"])
	end

	def student_search(users, s_name, gpa)
		s_users = users.joins(:student).where(["students.name LIKE ?", "%#{params[:name]}%"])
		if gpa
			s_users = s_users.where(["students.gpa >= ?", gpa])
		end
		return s_users
	end
end