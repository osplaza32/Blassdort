class CreateUsuarios < ActiveRecord::Migration[5.1]
  def change
    create_table :usuarios do |t|
      t.string :nombre
      t.string :email
      t.string :apellido
      t.string :cargo
      t.string :foto
      t.string :telefono
      t.string :conectado
      t.string :password
      t.string :pincode

      t.timestamps
    end
  end
end
