class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :subtotal, default: 0
      t.integer :total, default: 0
      t.integer :tax, default: 0
      t.integer :shipping_fee, default: 0
      t.integer :cash_on_delivery_fee, default: 0
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
