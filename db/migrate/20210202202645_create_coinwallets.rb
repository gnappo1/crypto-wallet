class CreateCoinwallets < ActiveRecord::Migration[5.2]
  def change
    create_table :coinwallets do |t|
      t.references :coin
      t.references :wallet
      t.decimal :amount

      t.timestamps null: false
    end
  end
end
