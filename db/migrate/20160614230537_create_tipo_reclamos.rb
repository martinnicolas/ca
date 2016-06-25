class CreateTipoReclamos < ActiveRecord::Migration
  def change
    create_table :tipo_reclamos do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
