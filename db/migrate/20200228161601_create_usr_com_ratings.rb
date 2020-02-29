class CreateUsrComRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :usr_com_ratings do |t|
      t.references :user_profile
      t.references :comment
      t.integer :rating, default: 0
      t.timestamps
    end
  end
end
