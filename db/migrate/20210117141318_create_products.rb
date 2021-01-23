class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name,              null: false
      t.text :describe,            null: false
      t.integer :category_id,      null: false
      t.integer :state_id,         null: false
      t.integer :ship_charge_id,   null: false
      t.integer :prefectures_id,   null: false
      t.integer :ship_day_id,      null: false
      t.integer :price,            null: false
      t.references :user,          null: false
      t.timestamps
    end
  end
end
