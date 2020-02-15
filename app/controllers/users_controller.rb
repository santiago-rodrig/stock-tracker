class UsersController < ApplicationController
  def my_portfolio
    @stocks = current_user.stocks
  end

  def show
    @user = User.find(params[:id])
    @stocks = @user.stocks
  end
end
