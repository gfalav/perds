class CreateEmpresas < ActiveRecord::Migration
  def self.up
    create_table :empresas do |t|
      t.string :nombre

      t.timestamps
    end
    
    Empresa.create(:nombre=>'Edesal')
    Empresa.create(:nombre=>'Edelar')
    Empresa.create(:nombre=>'Edesa')
  end

  def self.down
    drop_table :empresas
  end
end
