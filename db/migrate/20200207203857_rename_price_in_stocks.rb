class RenamePriceInStocks < ActiveRecord::Migration[6.0]
  def change
    rename_column :stocks, :price, :last_price
  end
end
