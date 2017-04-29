class HomeController < ApplicationController
  def index
    @profile = false 
   	@profile ||= current_user
  end
end
