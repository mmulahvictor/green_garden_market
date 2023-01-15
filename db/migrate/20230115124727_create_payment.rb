class CreatePayment < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.integer :order_id
      t.string :card_number
      t.string :expiration_date
      t.string :security_code

      t.timestamps
    end
  end
end
