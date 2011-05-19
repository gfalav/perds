class Dato < ActiveRecord::Base
	belongs_to :empresa
	belongs_to :area
	belongs_to :tdato
end
