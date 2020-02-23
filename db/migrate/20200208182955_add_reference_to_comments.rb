class AddReferenceToComments < ActiveRecord::Migration[5.2]
  def change
    change_table :comments do |t|
      t.references :parent_comment
    end
  end
end
