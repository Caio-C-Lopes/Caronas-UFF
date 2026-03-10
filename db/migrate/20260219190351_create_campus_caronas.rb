class CreateCampusCaronas < ActiveRecord::Migration[6.0]
  def change
    create_table :campus_caronas do |t|
      t.references :carona, null: false, foreign_key: true
      t.references :campus, null: false, foreign_key: true
      t.string :role

      t.timestamps
    end
  end
end
