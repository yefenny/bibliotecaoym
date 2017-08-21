class CreateCantidadlibros < ActiveRecord::Migration[5.1]
  def change
    create_table :cantidadlibros do |t|
      t.bigint :cantidad
      t.integer :libro_id
      t.timestamps
    end
  end
end
