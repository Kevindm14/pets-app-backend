class AddColumnToPet < ActiveRecord::Migration[6.1]
  def change
    add_column :pets, :perfil_photo, :string
  end
end
