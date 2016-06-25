class CreateReclamoUsuarios < ActiveRecord::Migration
  def change
    create_table :reclamo_usuarios do |t|
      t.references :reclamo, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
