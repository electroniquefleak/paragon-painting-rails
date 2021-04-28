class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.belongs_to :users
      t.belongs_to :projects
      t.integer :site_manager_id

      t.timestamps
    end
  end
end
