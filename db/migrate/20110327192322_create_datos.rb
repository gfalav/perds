class CreateDatos < ActiveRecord::Migration
  def self.up
    create_table :datos do |t|
      t.integer :empresa_id
      t.integer :tdato_id
      t.date :periodo
      t.integer :area_id
      t.float :dato

      t.timestamps
    end
  end

  def self.down
    drop_table :datos
  end
end
