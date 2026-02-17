class CreateCaronaParadas < ActiveRecord::Migration[6.0]
  def change
    create_table :carona_paradas do |t|
      t.references :carona, null: false, foreign_key: true
      t.references :parada, null: false, foreign_key: true

      t.timestamps
    end
  end
end
