class HomeController < ApplicationController
  def index
    @profile_signed = false 
   	@profile_signed ||= current_user
  end
end
