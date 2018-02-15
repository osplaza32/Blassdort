class CreateDia < ActiveRecord::Migration[5.1]
  def change
    create_table :dia do |t|
      t.string :nombre


      t.timestamps
    end
  end
end
