class StudentsController < ApplicationController
	def show
		@profile = Student.find(params[:id])
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
			@countries =  (Student.distinct.pluck(:country) + Recruiter.distinct.pluck(:country)).uniq
			@language_list = Language.distinct.pluck(:name)
			@program_list = FieldInterest.distinct.pluck(:name)
			@languages = Language.where(:user_id => current_user.id).pluck(:name)
			@programs = FieldInterest.where(:student_id => current_user.meta_id).pluck(:name)
		else
			redirect_to root_url
		end
	end
	
	def update
		if current_user.meta.update(student_params)
		 
				language_update

				programs_update


			redirect_to student_url(current_user.meta_id)
		else
			flash[:danger] = "error"
			redirect_to root_url
		end

	end

	private
		def student_params
			params.require(:student).permit(:name, :school, :bio, :gpa, :propic ,:country)
		end

		def language_update

			# language list update
			cur_languages = Language.where(:user_id => current_user.id).pluck(:name)

			if params[:languages]
				language_list = params[:languages]
			else
				language_list = []
			end


			#find deleted and newly created languages
			new_langs = (language_list - cur_languages) 

			deleted_langs = (cur_languages - language_list) 

			#update
			new_langs.each do |f|
				if f != ''
					Language.new(:name => f.strip, :user_id => current_user.id).save
				end
			end

			deleted_langs.each do |f|
				Language.where(:name => f, :user_id => current_user.id)[0].destroy
			end
		end

		def programs_update

			#Field of Interest update
			cur_programs = FieldInterest.where(:student_id => current_user.meta_id).pluck(:name)

			if params[:programs]
				program_list = params[:programs]
			else
				program_list = []
			end

			#find deleted and newly created programs

			new_programs = (program_list - cur_programs) 
			deleted_programs = (cur_programs - program_list)

			#update
			new_programs.each do |f|
				if f != ''
					FieldInterest.new(:name => f.strip, :student_id => current_user.meta_id).save
				end
			end

			deleted_programs.each do |f|
				FieldInterest.where(:name => f, :student_id => current_user.meta_id)[0].destroy
			end



		end


end
