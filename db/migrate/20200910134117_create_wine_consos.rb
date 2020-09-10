class CreateWineConsos < ActiveRecord::Migration[6.0]
  def change
    create_table :wine_consos do |t|
      t.references :wine, null: false, foreign_key: true
      t.references :conso_tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
