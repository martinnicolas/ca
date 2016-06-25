class CreateReclamos < ActiveRecord::Migration
  def change
    create_table :reclamos do |t|
      t.string :imagen
      t.string :titulo
      t.string :descripcion
      t.date :fecha
      t.references :ubicacion, index: true, foreign_key: true
      t.references :tipo_reclamo, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
