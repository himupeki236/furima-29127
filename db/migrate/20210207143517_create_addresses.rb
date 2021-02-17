class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :zip_cd,           null: false
      t.integer :prefecture_id,  null: false
      t.string :municipality,  null: false
      t.string :address,  null: false
      t.string :building
      t.string :tel,  null: false
      t.references :order_user,  null: false
      t.timestamps
    end
  end
end
