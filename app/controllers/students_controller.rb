class StudentsController < ApplicationController
	def show
		@Student = Student.find(params[:id])
		@owner = (user_signed_in? && User.is_owner?(current_user,@student))
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
			redirect_to root_url
		else
			flash[:danger] = "error"
			redirect_to root_url
		end

	end

	private
		def student_params
			params.require(:student).permit(:name, :school, :bio, :gpa)
		end
end
