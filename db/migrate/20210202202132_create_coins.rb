class CreateCoins < ActiveRecord::Migration[5.2]
  def change
    create_table :coins do |t|
      t.string :name
      t.decimal :value
      t.string :avatar

      t.timestamps null: false
    end
  end
end
