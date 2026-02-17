class CreateCampi < ActiveRecord::Migration[6.0]
  def change
    create_table :campi do |t|
      t.string :title
      t.string :address
      t.string :number
      t.string :neighborhood
      t.string :city
      t.string :cep
      t.date :deactivation_date

      t.timestamps
    end
    add_index :campi, :title, unique: true    
  end
end
