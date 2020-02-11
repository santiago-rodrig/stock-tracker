class UsersController < ApplicationController
  def my_portfolio
    @stocks = current_user.stocks
  end
end
