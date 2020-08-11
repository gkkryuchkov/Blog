class AddEditedToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :edited, :integer, default: 0
    add_column :comments, :deleted, :integer, default: 0
  end
end
