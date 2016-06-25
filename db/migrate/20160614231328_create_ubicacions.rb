class CreateUbicacions < ActiveRecord::Migration
  def change
    create_table :ubicacions do |t|
      t.string :latitud
      t.string :longitud

      t.timestamps null: false
    end
  end
end
