class CreateCaronas < ActiveRecord::Migration[6.0]
  def change
    create_table :caronas do |t|
      t.string :driver_name
      t.string :departure
      t.string :destination
      t.integer :passengers_number
      t.decimal :cost, precision: 10, scale: 2
      t.string :obs
      t.datetime :date_time

      t.timestamps
    end
  end
end
