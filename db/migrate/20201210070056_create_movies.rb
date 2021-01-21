class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.text :story, null: false
      t.datetime :release_date, null: false
      t.integer :running_time, null: false
      t.string :distribution, null: false
      t.string :director, null: false
      t.text :actor, null: false
      t.integer :finished, null: false, default: 0 #削除状態(0:未削除, 1:削除)
      
      t.timestamps
    end
  end
end
