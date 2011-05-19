class InformeController < ApplicationController
  def index
    @tabla = Array.new
    @ticks = Array.new
    @serie1 = Array.new
    @serie2 = Array.new
    @max = 0
    @min = 100
    
    if (params[:empresa] == nil)
      empresa = 1
    else
      empresa = params[:empresa].to_i
    end
    if (params[:area] == nil || params[:empresa_id].to_i != empresa)
      area = Area.where(:empresa_id=>empresa)[0].id
    else
      area = params[:area].to_i
    end
    if (params[:ffin]== nil)
      ffin = Dato.where(:empresa_id=>empresa).maximum(:periodo)
    else
      ffin = Date.new( (params[:ffin][0..3]).to_i,(params[:ffin][4..5]).to_i,1)
    end
    if (params[:fini]== nil)
      fini = ffin.prev_year
    else
      fini = Date.new( (params[:fini][0..3]).to_i,(params[:fini][4..5]).to_i,1)
    end
    #ajusta para que haya un año por lo menos
    if (ffin.prev_year < fini)
      fini = ffin.prev_year
    end
        
    @cabecera = Hash.new
    @cabecera[:empresa] = Empresa.find(empresa).nombre
    @cabecera[:empresa_id] = Empresa.find(empresa).id
    @cabecera[:area] = Area.find(area).nombre
    @cabecera[:area_id] = Area.find(area).id
    @cabecera[:fini] = (fini.year * 100 + fini.month).to_s
    @cabecera[:ffin] = (ffin.year * 100 + ffin.month).to_s
    @cabecera[:arrempresas] = Empresa.all
    @cabecera[:arrareas] = Area.where(:empresa_id=> empresa)
    
    n=0
    ftemp = fini.prev_year.prev_month

    while ftemp < ffin
      ftemp = ftemp.next_month
      h = Hash.new
      
      h[:periodo] = (ftemp.year*100+ftemp.month).to_s
      if (area == 1 || area == 10 || area == 18)
          h[:mem] =            Dato.where(:empresa_id=>empresa,:tdato_id=>2, :periodo=>ftemp..(ftemp.next_month-1)).sum(:dato)
          h[:mem] = (h[:mem] + Dato.where(:empresa_id=>empresa,:tdato_id=>3, :periodo=>ftemp..(ftemp.next_month-1)).sum(:dato))
          h[:mem] = (h[:mem] + Dato.where(:empresa_id=>empresa,:tdato_id=>11,:periodo=>ftemp..(ftemp.next_month-1)).sum(:dato))
          h[:mem] = (h[:mem] + Dato.where(:empresa_id=>empresa,:tdato_id=>1, :area_id=>[8,16], :periodo=>ftemp..(ftemp.next_month-1)).sum(:dato))
          h[:mem] = (h[:mem] - Dato.where(:empresa_id=>empresa,:tdato_id=>1, :area_id=>[9,17], :periodo=>ftemp..(ftemp.next_month-1)).sum(:dato))
          h[:otr] =           Dato.where(:empresa_id=>empresa,:tdato_id=>4, :periodo=>ftemp..(ftemp.next_month-1)).sum(:dato)
          h[:gen] =           Dato.where(:empresa_id=>empresa,:tdato_id=>5, :periodo=>ftemp..(ftemp.next_month-1)).sum(:dato)
          h[:dis] =           Dato.where(:empresa_id=>empresa,:tdato_id=>6, :periodo=>ftemp..(ftemp.next_month-1)).sum(:dato)
          h[:rec] =           Dato.where(:empresa_id=>empresa,:tdato_id=>7, :periodo=>ftemp..(ftemp.next_month-1)).sum(:dato)
          h[:aut] =           Dato.where(:empresa_id=>empresa,:tdato_id=>8, :periodo=>ftemp..(ftemp.next_month-1)).sum(:dato)
          h[:gme] =           Dato.where(:empresa_id=>empresa,:tdato_id=>9, :periodo=>ftemp..(ftemp.next_month-1)).sum(:dato)
          h[:gma] =           Dato.where(:empresa_id=>empresa,:tdato_id=>10,:periodo=>ftemp..(ftemp.next_month-1)).sum(:dato)
      elsif (area == 8 || area == 9 || area == 16 || area == 17)
          h[:mem] = Dato.where(:empresa_id=>empresa,:tdato_id=>1, :area_id=>[8,16],    :periodo=>ftemp..(ftemp.next_month-1)).sum(:dato)
          h[:otr] = 0
          h[:gen] = 0
          h[:dis] = Dato.where(:empresa_id=>empresa,:tdato_id=>1, :area_id=>[9,17],    :periodo=>ftemp..(ftemp.next_month-1)).sum(:dato)
          h[:rec] = 0
          h[:aut] = 0
          h[:gme] = 0
          h[:gma] = 0
      else
          h[:mem] =            Dato.where(:empresa_id=>empresa,:tdato_id=>2, :area_id=>area, :periodo=>ftemp..(ftemp.next_month-1)).sum(:dato)
          h[:mem] = (h[:mem] + Dato.where(:empresa_id=>empresa,:tdato_id=>3, :area_id=>area, :periodo=>ftemp..(ftemp.next_month-1)).sum(:dato))
          h[:mem] = (h[:mem] + Dato.where(:empresa_id=>empresa,:tdato_id=>11,:area_id=>area, :periodo=>ftemp..(ftemp.next_month-1)).sum(:dato))
          h[:otr] =            Dato.where(:empresa_id=>empresa,:tdato_id=>4, :area_id=>area, :periodo=>ftemp..(ftemp.next_month-1)).sum(:dato)
          h[:gen] =            Dato.where(:empresa_id=>empresa,:tdato_id=>5, :area_id=>area, :periodo=>ftemp..(ftemp.next_month-1)).sum(:dato)
          h[:dis] =            Dato.where(:empresa_id=>empresa,:tdato_id=>6, :area_id=>area, :periodo=>ftemp..(ftemp.next_month-1)).sum(:dato)
          h[:rec] =            Dato.where(:empresa_id=>empresa,:tdato_id=>7, :area_id=>area, :periodo=>ftemp..(ftemp.next_month-1)).sum(:dato)
          h[:aut] =            Dato.where(:empresa_id=>empresa,:tdato_id=>8, :area_id=>area, :periodo=>ftemp..(ftemp.next_month-1)).sum(:dato)
          h[:gme] =            Dato.where(:empresa_id=>empresa,:tdato_id=>9, :area_id=>area, :periodo=>ftemp..(ftemp.next_month-1)).sum(:dato)
          h[:gma] =            Dato.where(:empresa_id=>empresa,:tdato_id=>10, :area_id=>area, :periodo=>ftemp..(ftemp.next_month-1)).sum(:dato)
      end
      h[:ing] = (h[:mem]+h[:otr]+h[:gen])
      h[:egr] = (h[:dis]+h[:rec]+h[:aut]+h[:gme]+h[:gma])
      h[:per] = (h[:ing]-h[:egr])
      if (h[:ing]!=0)
        h[:pep] = ((1 - h[:egr]/h[:ing])*100)
      else
        h[:pep] = 0
      end
      if (n>11)
        h[:ina] = (@tabla[n-11][:ing] + @tabla[n-10][:ing] + @tabla[n-9][:ing] + @tabla[n-8][:ing] + @tabla[n-7][:ing] + @tabla[n-6][:ing] + @tabla[n-5][:ing] + @tabla[n-4][:ing] + @tabla[n-3][:ing] + @tabla[n-2][:ing] + @tabla[n-1][:ing] + h[:ing])
        h[:ega] = (@tabla[n-11][:egr] + @tabla[n-10][:egr] + @tabla[n-9][:egr] + @tabla[n-8][:egr] + @tabla[n-7][:egr] + @tabla[n-6][:egr] + @tabla[n-5][:egr] + @tabla[n-4][:egr] + @tabla[n-3][:egr] + @tabla[n-2][:egr] + @tabla[n-1][:egr] + h[:egr])
        h[:pera] = (h[:ing]-h[:egr])
        if (h[:ina]!=0)
          h[:pepa] = ((1 - h[:ega]/h[:ina])*100)
        else
          h[:pepa] = 0
        end
      else
        h[:ina] = 0
        h[:ega] = 0
        h[:pera] = 0
        h[:pepa] = 0
      end

      @tabla << h

      @ticks << (ftemp.year*100+ftemp.month).to_s
      @serie1 << h[:pep]
      @serie2 << h[:pepa]
      
      n = n + 1
    end
    
    @tabla = @tabla.drop(12)
    @ticks = @ticks.drop(12)
    @serie1 = @serie1.drop(12)
    @serie2 = @serie2.drop(12)
    
    @serie1.each {|s1|
      if (@max < s1)
        @max = s1
      end      
      if (@min > s1)
        @min = s1
      end
    }
    @serie2.each {|s2|
      if (@max < s2)
        @max = s2
      end
      if (@min > s2)
        @min = s2
      end
    }
    @min = @min - 4
    @max = @max + 1    
  end

end
