class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :rating
      t.text :comment_body
      t.references :user_profile
      t.references :article, null: false
      t.timestamps
    end
  end
end
