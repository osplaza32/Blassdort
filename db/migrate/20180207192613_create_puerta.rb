class CreatePuerta < ActiveRecord::Migration[5.1]
  def change
    create_table :puerta do |t|
      t.string :descr
      t.string :horafiinicio
      t.string :horafifin
      t.belongs_to :empresa, index: true
      t.belongs_to :hardware,index: true

      t.timestamps
    end
  end
end
