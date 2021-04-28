class CreateTools < ActiveRecord::Migration[6.1]
  def change
    create_table :tools do |t|
      t.string :item_name
      t.text :description
      t.integer :quantity
      
      t.timestamps
    end
  end
end
