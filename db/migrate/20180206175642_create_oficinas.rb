class CreateOficinas < ActiveRecord::Migration
  def change
    create_table :oficinas,id:false do |t|
      t.string :uuid, limit: 36, primary: true

      t.string :nombre
      t.string :direccion

      t.timestamps
    end
  end
end
