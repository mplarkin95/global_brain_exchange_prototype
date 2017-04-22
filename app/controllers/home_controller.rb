class HomeController < ApplicationController
  def index
    @user ||= current_user
    if user_signed_in?
      @profile = current_user.meta
      @student = current_user.meta_type == "Student"
    end
  end
end
