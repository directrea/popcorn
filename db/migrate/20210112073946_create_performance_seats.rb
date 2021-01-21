class CreatePerformanceSeats < ActiveRecord::Migration[5.2]
  def change
    create_table :performance_seats do |t|
      t.references :performance, null: false
      t.references :seat, null: false
      t.timestamps
    end
  end
end
