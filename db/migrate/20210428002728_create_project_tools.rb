class CreateProjectTools < ActiveRecord::Migration[6.1]
  def change
    create_table :project_tools do |t|
      t.string :warehouse_location
      t.belongs_to :tool
      t.belongs_to :project

      t.timestamps
    end
  end
end
