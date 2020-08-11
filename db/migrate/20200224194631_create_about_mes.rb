class CreateAboutMes < ActiveRecord::Migration[5.2]
  def change
    create_table :about_mes do |t|
      t.text :body, null: false, default: 'test'
      t.timestamps
    end
  end
end
