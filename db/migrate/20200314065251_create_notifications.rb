class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :text
      t.references :article, foreign_key: true
      t.references :comment, foreign_key: true
      t.references :user_profile, foreign_key: true
      t.integer :seen, default: 0

      t.timestamps
    end
  end
end
