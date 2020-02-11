class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks
  validates :name, :ticker, presence: true

  after_find -> (stock) do
    tmp = Stock.new_lookup(stock.ticker)
    stock.update_attribute(:price, tmp.price) if tmp.price != stock.price
  end

  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new

    begin
      company_name = client.company(ticker_symbol).company_name
      stock_price = client.price(ticker_symbol)
    rescue => e
      return nil
    end

    new(ticker: ticker_symbol, name: company_name, price: stock_price)
  end

  def self.find_or_init(ticker_symbol)
    find_by(ticker: ticker_symbol) || new_lookup(ticker_symbol)
  end
end
