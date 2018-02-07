class CreateHorarios < ActiveRecord::Migration[5.1]
  def change
    create_table :horarios do |t|
      t.string :inicio
      t.string :fin

      t.timestamps
    end
  end
end
