class ReclamoUsuario < ActiveRecord::Base
  belongs_to :reclamo
  belongs_to :user
end
