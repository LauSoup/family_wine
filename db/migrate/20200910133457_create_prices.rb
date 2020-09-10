class CreatePrices < ActiveRecord::Migration[6.0]
  def change
    create_table :prices do |t|
      t.string :price_fork

      t.timestamps
    end
  end
end
