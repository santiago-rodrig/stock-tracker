class Stock < ApplicationRecord
  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new
    name = client.company(ticker_symbol).company_name
    price = client.price(ticker_symbol)
    new ticker: ticker_symbol, name: name, last_price: price
  end
end
