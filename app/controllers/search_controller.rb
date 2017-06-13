class SearchController < ApplicationController

	def index
		if user_signed_in?
			if current_user.meta_type == "Recruiter"
				redirect_to search_students_url
				return
			else
				redirect_to search_recruiters_url
				return
			end
		


		else
			@users = User.all
			@search_type = params[:type] 
			if params[:type] == "Student"
				@users = student_search_simple(@users,params[:name])
			elsif params[:type] == "Recruiter"
				@users = recruiter_search_simple(@users,params[:name])
			else
				@users = []
			end
		end
	end

	def student_search
		@countries = Student.distinct.pluck(:country)
		@users = student_search_simple(User.all, params[:name])
		@languages = Language.group(:name).pluck(:name)
		@programs = FieldInterest.group(:name).pluck(:name)

		if params[:country] && params[:country]!= ''
			@users = @users.where(["students.country = ?","#{params[:country]}"])
		end

		if params[:gpa] && params[:gpa] != ''
			@users = @users.where(["students.gpa >= #{params[:gpa]}"])
		end

		if params[:language] != ''
			l = Language.where(:name => params[:language]).pluck(:user_id)
			@users = @users.where(:id => l)
		end

		if params[:program] != ''
			l = FieldInterest.where(:name => params[:program]).pluck(:student_id)
			@users = @users.where(:meta_id => l)
		end



	end

	def recruiter_search
		@countries = Recruiter.distinct.pluck(:country)
		@schools = Recruiter.distinct.pluck(:school)

		@users = User.all
		@users = recruiter_search_simple(@users,params[:name])
		if params[:school] && params[:school] != ''
			@users = @users.where(["recruiters.school = ?","#{params[:school]}"])
		end
		if params[:country] && params[:country] != ''
			@users = @users.where(["recruiters.country = ?","#{params[:country]}"])

		end
		
	end

	private

	def recruiter_search_simple(users, r_name)
		return users.joins(:recruiter).where(["recruiters.name LIKE ?", "%#{r_name}%"])
	end

	def student_search_simple(users, s_name)
		return users.joins(:student).where(["students.name LIKE ?", "%#{s_name}%"])
		

		
	end
end
