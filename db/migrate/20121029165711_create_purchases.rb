class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :item_id
      t.integer :quantity
      t.boolean :purchased

      t.timestamps
    end
  end
end
