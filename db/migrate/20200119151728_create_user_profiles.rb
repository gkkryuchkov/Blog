class CreateUserProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_profiles do |t|
      t.string :username
      t.string :status
      t.references :user, foreign_key:true, null:false
      t.timestamps
    end
  end
end
