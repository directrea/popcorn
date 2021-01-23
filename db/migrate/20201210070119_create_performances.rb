class CreatePerformances < ActiveRecord::Migration[5.2]
  def change
    create_table :performances do |t|
      t.references :movie, foreign_key: true, null: false
      t.date :screening_date, null: false
      t.time :start_time, null: false
      t.time :end_time, null: false
      t.integer :screen, null: false
      
      t.timestamps
    end
  end
end
