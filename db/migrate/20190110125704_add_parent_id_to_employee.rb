class AddParentIdToEmployee < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :parent_id, :integer
  end
end
