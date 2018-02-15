class CreatePermisos < ActiveRecord::Migration[5.1]
  def change
    create_table :permisos do |t|
      t.integer :horarios
      t.belongs_to :usuario, index: true
      t.belongs_to :puerta,index: true
      t.belongs_to :dia,index:true
      t.belongs_to :horario,index:true
      t.timestamps
    end
  end
end
