class SessionsController < ApplicationController
  def new

  end

  def create
  	user = User.find_by_email(params[:email]).try(:authenticate,params[:password])
  	if user
  		session[:user_id] = user.id
  		redirect_to "/shoes"
  	else
  		flash[:errors] = ["Invalid Combination"]
  		redirect_to :back
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to "/main"
  end
end
