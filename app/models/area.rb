class Area < ActiveRecord::Base
	belongs_to :empresa
	has_many :datos
end
