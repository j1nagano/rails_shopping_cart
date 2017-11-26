class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :mail
      t.string :address
      t.string :password

      t.timestamps
    end
  end
end
