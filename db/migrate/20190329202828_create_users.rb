class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :slack_id
      t.string :is_admin
      t.string :is_bot
      t.string :name
      t.string :last_name
      t.string :email
      t.string :image_42
      t.string :real_name
      t.string :display_name

      t.timestamps
    end
  end
end
