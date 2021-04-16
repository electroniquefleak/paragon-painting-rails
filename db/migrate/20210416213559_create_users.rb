class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :name
      t.string :email, null: false
      t.string :password_digest
      t.integer :role, default: 0, null: false

      t.timestamps
    end
  end
end
