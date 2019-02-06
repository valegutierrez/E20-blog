class PagesController < ApplicationController

  def dashboard
    @users = User.all
  end

  def change_role
    @user = User.find(params[:user_id])
    if @user.role == "guest"
      @user.role = "admin"
    end
    @user.save!
    redirect_to pages_dashboard_path
  end

end
