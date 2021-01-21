class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :user_name, null: false
      t.string :full_name, null: false
      t.string :email, null: false
      t.date :birthday, null: false
      t.integer :sex, null: false, default: 0
      t.integer :credit_number, null: false
      t.date :expiration_date, null: false
      t.integer :authentication_number, null: false
      t.boolean :administrator
  
      t.timestamps
    end
  end
end
