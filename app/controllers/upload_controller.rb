class UploadController < ApplicationController
  def index
  end

  def procesa
    rta = Array.new
    empresa = ''
    tdato = ''
    periodo = ''
    
    params[:archivo].read.each_line {|l|
      arrtmp = l.split(/\t|\r|\n/)
      if (arrtmp[0]!='' && arrtmp.length>0)
        if (arrtmp[0][0..2]=='Ede')
          arr_l1=arrtmp[0].split('/')
          empresa = Empresa.where(:nombre=>arr_l1[0])[0].id
          tdato = Tdato.where(:tipo=>arr_l1[1])[0].id
          Dato.destroy_all(:empresa_id=>empresa,:tdato_id=>tdato)
        else
          arr_ldata = arrtmp[0].split('/')
          periodo = Date.new(arr_ldata[1].to_i,arr_ldata[0].to_i,1)
          case empresa
            when 1
              if (tdato == 1)
                Dato.create(:empresa_id=>empresa,:tdato_id=>tdato,:periodo=>periodo,:area_id=>8,:dato=>arrtmp[1].to_f)
                Dato.create(:empresa_id=>empresa,:tdato_id=>tdato,:periodo=>periodo,:area_id=>9,:dato=>arrtmp[2].to_f)
              else
                Dato.create(:empresa_id=>empresa,:tdato_id=>tdato,:periodo=>periodo,:area_id=>2,:dato=>arrtmp[1].to_f)
                Dato.create(:empresa_id=>empresa,:tdato_id=>tdato,:periodo=>periodo,:area_id=>3,:dato=>arrtmp[2].to_f)
                Dato.create(:empresa_id=>empresa,:tdato_id=>tdato,:periodo=>periodo,:area_id=>4,:dato=>arrtmp[3].to_f)
                Dato.create(:empresa_id=>empresa,:tdato_id=>tdato,:periodo=>periodo,:area_id=>5,:dato=>arrtmp[4].to_f)
                Dato.create(:empresa_id=>empresa,:tdato_id=>tdato,:periodo=>periodo,:area_id=>6,:dato=>arrtmp[5].to_f)
                Dato.create(:empresa_id=>empresa,:tdato_id=>tdato,:periodo=>periodo,:area_id=>7,:dato=>arrtmp[6].to_f)
              end
            when 2
              if (tdato == 1)
                Dato.create(:empresa_id=>empresa,:tdato_id=>tdato,:periodo=>periodo,:area_id=>16,:dato=>arrtmp[1].to_f)
                Dato.create(:empresa_id=>empresa,:tdato_id=>tdato,:periodo=>periodo,:area_id=>17,:dato=>arrtmp[2].to_f)
              else
                Dato.create(:empresa_id=>empresa,:tdato_id=>tdato,:periodo=>periodo,:area_id=>11,:dato=>arrtmp[1].to_f)
                Dato.create(:empresa_id=>empresa,:tdato_id=>tdato,:periodo=>periodo,:area_id=>12,:dato=>arrtmp[2].to_f)
                Dato.create(:empresa_id=>empresa,:tdato_id=>tdato,:periodo=>periodo,:area_id=>13,:dato=>arrtmp[3].to_f)
                Dato.create(:empresa_id=>empresa,:tdato_id=>tdato,:periodo=>periodo,:area_id=>14,:dato=>arrtmp[4].to_f)
                Dato.create(:empresa_id=>empresa,:tdato_id=>tdato,:periodo=>periodo,:area_id=>15,:dato=>arrtmp[5].to_f)
              end
            when 3
                Dato.create(:empresa_id=>empresa,:tdato_id=>tdato,:periodo=>periodo,:area_id=>19,:dato=>arrtmp[1].to_f)
                Dato.create(:empresa_id=>empresa,:tdato_id=>tdato,:periodo=>periodo,:area_id=>20,:dato=>arrtmp[2].to_f)
                Dato.create(:empresa_id=>empresa,:tdato_id=>tdato,:periodo=>periodo,:area_id=>21,:dato=>arrtmp[3].to_f)
                Dato.create(:empresa_id=>empresa,:tdato_id=>tdato,:periodo=>periodo,:area_id=>22,:dato=>arrtmp[4].to_f)
                Dato.create(:empresa_id=>empresa,:tdato_id=>tdato,:periodo=>periodo,:area_id=>23,:dato=>arrtmp[5].to_f)            
                Dato.create(:empresa_id=>empresa,:tdato_id=>tdato,:periodo=>periodo,:area_id=>24,:dato=>arrtmp[6].to_f)
                Dato.create(:empresa_id=>empresa,:tdato_id=>tdato,:periodo=>periodo,:area_id=>25,:dato=>arrtmp[7].to_f)
                Dato.create(:empresa_id=>empresa,:tdato_id=>tdato,:periodo=>periodo,:area_id=>26,:dato=>arrtmp[8].to_f)
                Dato.create(:empresa_id=>empresa,:tdato_id=>tdato,:periodo=>periodo,:area_id=>27,:dato=>arrtmp[9].to_f)
                Dato.create(:empresa_id=>empresa,:tdato_id=>tdato,:periodo=>periodo,:area_id=>28,:dato=>arrtmp[10].to_f)            
                Dato.create(:empresa_id=>empresa,:tdato_id=>tdato,:periodo=>periodo,:area_id=>29,:dato=>arrtmp[11].to_f)            
          end
        end
      end
      rta << empresa.to_s + '/' + tdato.to_s + '/' + periodo.to_s
    }
    render :text=> rta
  end

end
