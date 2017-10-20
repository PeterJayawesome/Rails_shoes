class UsersController < ApplicationController

  def show
  	if session[:user_id] != params[:id].to_i
  		redirect_to "/dashboard/#{session[:user_id]}"
  	end
  	@rest_shoes = current_user.sell_shoes.where(buyer:nil)
    @sold_shoes = current_user.sell_shoes.where("status")
    @buy_shoes = current_user.buy_shoes
    @income = @sold_shoes.sum(:amount)
    @purchase = @buy_shoes.sum(:amount)
  end

  def create
  	user = User.new(reg_params)
  	if user.save
  		session[:user_id] = user.id
  		redirect_to "/shoes"
  	else
  		flash[:errors] = user.errors.full_messages
  		redirect_to :back
  	end
  end

  private

  def reg_params
  	params.require(:user).permit(:first_name,:last_name,:email,:password)
  end
end
