class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :price
      t.string :brand
      t.string :warantine_time
      t.string :strength
      t.string :flavor
      t.string :size
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
