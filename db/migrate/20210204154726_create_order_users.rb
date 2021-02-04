class CreateOrderUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :order_users do |t|
      t.references :user,          null: false
      t.references :product,       null: false
      t.timestamps
    end
  end
end
