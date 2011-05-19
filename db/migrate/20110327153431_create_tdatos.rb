class CreateTdatos < ActiveRecord::Migration
  def self.up
    create_table :tdatos do |t|
      t.string :tipo

      t.timestamps
    end
    
    Tdato.create(:tipo=>'LAT')
    Tdato.create(:tipo=>'MEM')
    Tdato.create(:tipo=>'Frontera')
    Tdato.create(:tipo=>'Otros')
    Tdato.create(:tipo=>'Generacion')
    Tdato.create(:tipo=>'Distribuidora')
    Tdato.create(:tipo=>'Recuperos')
    Tdato.create(:tipo=>'Cons Propios')
    Tdato.create(:tipo=>'Gume')
    Tdato.create(:tipo=>'Guma')
    Tdato.create(:tipo=>'Ajustes')
  end

  def self.down
    drop_table :tdatos
  end
end
