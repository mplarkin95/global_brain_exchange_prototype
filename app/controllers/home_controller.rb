class HomeController < ApplicationController
	def index
		@user ||= current_user
		if @user
			@profile = @user.meta
		end
	end
end
