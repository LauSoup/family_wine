class CreateConsoTags < ActiveRecord::Migration[6.0]
  def change
    create_table :conso_tags do |t|
      t.string :conso_name

      t.timestamps
    end
  end
end
