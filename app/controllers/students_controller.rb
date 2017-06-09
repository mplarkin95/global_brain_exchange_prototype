class StudentsController < ApplicationController
	def show
		@profile = Student.find(params[:id])
		@country = Country.where(:user_id => User.where(:meta_type => "Student", :meta_id => @profile.id))
		@languages = Language.where(:user_id => User.where(:meta_type => "Student", :meta_id => @profile.id))
		@interest = FieldInterest.where(:student_id => @profile.id)
		if user_signed_in?
			@owner = User.is_owner?(current_user,@profile)
		end
		if @owner
			@connections = current_user.friends
		elsif user_signed_in?
			@friendable = (current_user.meta_type != "Student")
			@connected = current_user.friends_with?(@profile.user)
		end

	end

	def edit
		student = Student.find(params[:id])
		if user_signed_in? && User.is_owner?(current_user,student)
			@student = student
		else
			redirect_to root_url
		end
	end
	
	def update
		if current_user.meta.update(student_params)
			
			language_list = params[:languages].split(',')
			language_list.each do |f|
				Language.new(:name => f.strip, :user_id => current_user.id).save
			end

			program_list = params[:programs].split(',')
			program_list.each do |f|
				FieldInterest.new(:name => f.strip, :student_id => current_user.meta_id).save
			end

			Country.new(:name => params[:country].strip, :user_id => current_user.id ).save

			redirect_to root_url
		else
			flash[:danger] = "error"
			redirect_to root_url
		end

	end

	private
		def student_params
			params.require(:student).permit(:name, :school, :bio, :gpa, :propic)
		end
end
