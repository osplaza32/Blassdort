class CreatePermisos < ActiveRecord::Migration[5.1]
  def change
    create_table :permisos do |t|
      t.integer :horarios
      t.string :estado
      t.belongs_to :usuario, index: true
      t.belongs_to :puerta,index: true
      t.timestamps
    end
  end
end
