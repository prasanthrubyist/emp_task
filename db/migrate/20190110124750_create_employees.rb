class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.float :salary
      t.integer :rating
      t.boolean :resigned

      t.timestamps
    end
  end
end
