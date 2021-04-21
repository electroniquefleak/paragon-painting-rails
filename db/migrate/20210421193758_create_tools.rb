class CreateTools < ActiveRecord::Migration[6.1]
  def change
    create_table :tools do |t|
      t.string :paint
      t.string :brush
      t.string :ladders
      t.string :scaffolding
      t.string :tarps
      t.string :wall_tape
      t.belongs_to :project

      t.timestamps
    end
  end
end
