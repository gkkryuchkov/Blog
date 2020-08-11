class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :rating, default: 0
      t.text :content
      t.integer :commentable_id
      t.string :commentable_type
      t.references :user_profile
      t.timestamps
    end
  end
end
