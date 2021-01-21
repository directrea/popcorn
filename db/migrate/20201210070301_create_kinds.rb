class CreateKinds < ActiveRecord::Migration[5.2]
  def change
    create_table :kinds do |t|
      t.string :kind_name, null: false
      t.integer :fee, null: false
      t.timestamps
    end
  end
end
