class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_stocks
  has_many :stocks, through: :user_stocks
  has_many :friendships
  has_many :friends, through: :friendships

  def can_track_stock?(ticker_symbol)
    !(stocks.count == 10 || stocks.find_by(ticker: ticker_symbol))
  end

  def full_name
    return first_name.to_s + ' ' + last_name.to_s if first_name || last_name

    'Anonymous'
  end
end
