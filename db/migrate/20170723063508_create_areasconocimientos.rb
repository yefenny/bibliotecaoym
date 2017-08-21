class CreateAreasconocimientos < ActiveRecord::Migration[5.1]
  def change
    create_table :areasconocimientos do |t|
      t.string  :name
      t.timestamps
    end
    add_index :areasconocimientos, :name,     unique: true
  end
end
