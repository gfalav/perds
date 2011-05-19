class Empresa < ActiveRecord::Base
	has_many :areas
	has_many :datos
end
