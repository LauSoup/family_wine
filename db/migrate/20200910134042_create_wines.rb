class CreateWines < ActiveRecord::Migration[6.0]
  def change
    create_table :wines do |t|
      t.string :name
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.references :price, null: false, foreign_key: true
      t.references :region, null: false, foreign_key: true

      t.timestamps
    end
  end
end
