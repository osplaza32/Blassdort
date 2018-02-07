class CreateMetricas < ActiveRecord::Migration[5.1]
  def change
    create_table :metricas do |t|
      t.integer :usuario
      t.integer :puerta
      t.date :momento

      t.timestamps
    end
  end
end
