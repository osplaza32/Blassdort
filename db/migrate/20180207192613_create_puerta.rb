class CreatePuerta < ActiveRecord::Migration[5.1]
  def change
    create_table :puerta do |t|
      t.string :descr
      t.string :horafiinicio
      t.string :horafifin

      t.timestamps
    end
  end
end
