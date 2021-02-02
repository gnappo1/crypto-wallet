class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :sender_wallet
      t.references :receiver_wallet
      t.decimal :amount
      t.datetime :timestamp
      t.decimal :fee
      t.string :transaction_id
      t.decimal :hash_rate
      t.string :category
      t.string :status
      t.string :coin

      t.timestamps null: false
    end
  end
end
