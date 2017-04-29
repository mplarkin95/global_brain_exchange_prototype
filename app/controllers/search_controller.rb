class SearchController < ApplicationController

	def index
		if user_signed_in?
			@users = User.where.not(meta_type: current_user.meta_type)
		else
			@users = User.all.order("created_on")
		end
	end

end