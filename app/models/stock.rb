class Stock < ApplicationRecord
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
end
