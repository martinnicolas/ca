class ReclamoUsuario < ApplicationRecord
  belongs_to :reclamo
  belongs_to :user
end
