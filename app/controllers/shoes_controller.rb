class ShoesController < ApplicationController

  def index
  	if not session[:user_id]
  		redirect_to "/main"
  	end
  	@shoes = Shoe.where(buyer:nil)
  end

  def sell
  	shoe = Shoe.new(seller:current_user,name:params[:name],amount:params[:amount])
  	if shoe.save
  		redirect_to "/shoes"
  	else
  		flash[:errors] = shoe.errors.full_messages
  		redirect_to :back
  	end
  end

  def buy
  	shoe = Shoe.find_by_id(params[:id])
  	if shoe and not shoe.buyer
  		shoe.status = true
  		shoe.buyer = current_user
  		shoe.save
  	end
  	redirect_to "/dashboard/#{session[:user_id]}"
  end

  def destroy
  	shoe = Shoe.find_by_id(params[:id])
  	if shoe and shoe.seller_id == session[:user_id]
  		shoe.destroy
  	end
  	redirect_to :back
  end
end
