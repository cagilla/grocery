class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :unit
      t.integer :num_required
      t.integer :num_onhand

      t.timestamps
    end
  end
end
