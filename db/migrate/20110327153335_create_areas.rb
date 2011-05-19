class CreateAreas < ActiveRecord::Migration
  def self.up
    create_table :areas do |t|
      t.string :nombre
      t.integer :empresa_id

      t.timestamps
    end
    
    
    Area.create(:nombre=>'Prov San Luis',:empresa_id=>1)
    Area.create(:nombre=>'Capital',:empresa_id=>1)
    Area.create(:nombre=>'Villa Mercedes',:empresa_id=>1)
    Area.create(:nombre=>'La Toma',:empresa_id=>1)
    Area.create(:nombre=>'Merlo',:empresa_id=>1)
    Area.create(:nombre=>'Quines',:empresa_id=>1)
    Area.create(:nombre=>'Fortuna',:empresa_id=>1)
    Area.create(:nombre=>'132kV Ingreso',:empresa_id=>1)
    Area.create(:nombre=>'132kV Egreso',:empresa_id=>1)
    Area.create(:nombre=>'Prov La Rioja',:empresa_id=>2)
    Area.create(:nombre=>'Capital',:empresa_id=>2)
    Area.create(:nombre=>'Chilecito',:empresa_id=>2)
    Area.create(:nombre=>'Aimogasta',:empresa_id=>2)
    Area.create(:nombre=>'Sur',:empresa_id=>2)
    Area.create(:nombre=>'Villa Union',:empresa_id=>2)
    Area.create(:nombre=>'132kV Ingreso',:empresa_id=>2)
    Area.create(:nombre=>'132kV Egreso',:empresa_id=>2)
    Area.create(:nombre=>'Prov Salta',:empresa_id=>3)
    Area.create(:nombre=>'Cafayate',:empresa_id=>3)
    Area.create(:nombre=>'Capital',:empresa_id=>3)
    Area.create(:nombre=>'Guemes',:empresa_id=>3)
    Area.create(:nombre=>'J V Gonzalez',:empresa_id=>3)
    Area.create(:nombre=>'La Candelaria',:empresa_id=>3)
    Area.create(:nombre=>'Metan',:empresa_id=>3)
    Area.create(:nombre=>'Oran',:empresa_id=>3)
    Area.create(:nombre=>'S A Cobres',:empresa_id=>3)
    Area.create(:nombre=>'Aislados',:empresa_id=>3)
    Area.create(:nombre=>'Tartagal',:empresa_id=>3)
    Area.create(:nombre=>'Valle de Lerma',:empresa_id=>3)

  end

  def self.down
    drop_table :areas
  end
end
