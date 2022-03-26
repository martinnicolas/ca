class TipoReclamo < ApplicationRecord
	def to_s
		self.nombre
	end
end
