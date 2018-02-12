class CreateUsuarios < ActiveRecord::Migration[5.1]
  def change
    create_table :usuarios do |t|
      t.string :nombre
      t.string :email
      t.string :apellido
      t.string :cargo
      t.string :foto
      t.string :telefono
      t.string :role
      t.string :conectado
      t.string :password_digest
      t.string :pincode
      t.belongs_to :empresa , index: true

      t.timestamps

    end

  end
end
