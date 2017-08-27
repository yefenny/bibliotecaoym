class CreateLibroprestamos < ActiveRecord::Migration[5.1]
  def change
    create_table :libroprestamos do |t|
      t.integer :libro_id
      t.date :fecha_prestamo
      t.timestamps
    end
  end
end
