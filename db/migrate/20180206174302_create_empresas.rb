class CreateEmpresas < ActiveRecord::Migration
  def change
    create_table(:empresas,id:false) do |t|
      t.string :uuid, limit: 36, primary: true
      t.string :nombre
      t.string :puertas
      t.string :logo

      t.timestamps
    end
  end
end
