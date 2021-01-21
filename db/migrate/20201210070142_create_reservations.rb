class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :member, null: false
      t.references :performance, null: false
      t.references :kind, null: false
      t.timestamps
    end
  end
end
