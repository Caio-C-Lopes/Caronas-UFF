class CreateParadas < ActiveRecord::Migration[6.0]
  def change
    create_table :paradas do |t|
      t.string :title

      t.timestamps
    end
    add_index :paradas, :title, unique: true
  end
end
