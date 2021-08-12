class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :species
      t.string :gender
      t.datetime :day_of_birth
      t.string :age
      t.integer :weigth
      t.string :size
      t.text :description
      t.string :reason
      t.string :country
      t.string :province
      t.string :contact_phone
      t.string :status

      t.timestamps
    end
  end
end
