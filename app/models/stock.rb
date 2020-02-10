class Stock < ApplicationRecord
  def new_lookup(ticker_symbol)
    client = IEX::Api::Client.new
    client.price(ticker_symbol)
  end
end
