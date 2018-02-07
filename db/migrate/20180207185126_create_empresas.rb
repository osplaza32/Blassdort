class CreateEmpresas < ActiveRecord::Migration[5.1]
  def change
    create_table :empresas do |t|
      t.string :nombre
      t.string :puertas
      t.string :logo

      t.timestamps
    end
  end
end
