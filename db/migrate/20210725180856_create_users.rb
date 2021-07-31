class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.datetime :day_of_birth
      t.string :gender
      t.string :country
      t.string :province
      t.string :perfil_photo
      t.string :access_token

      t.timestamps
    end
  end
end
