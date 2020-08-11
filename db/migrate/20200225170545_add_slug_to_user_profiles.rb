class AddSlugToUserProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :user_profiles, :slug, :string
    add_index :user_profiles, :slug, unique: true
  end
end
