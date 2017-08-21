class CreatePrestamos < ActiveRecord::Migration[5.1]
  def change
    create_table :prestamos do |t|
      t.bigint :estudiante_id,             	null: false
      t.bigint :libro_id, 					null: false
      t.date :fechap,					null: false
      t.date :fechae,					null: false
      t.date :fechad,					null: false
      t.integer :mora_id
      t.string :created_by,					null: false
      t.timestamps
    end
  end
end
