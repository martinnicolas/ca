class Reclamo < ActiveRecord::Base
  mount_uploader :imagen, ImagenUploader

  belongs_to :ubicacion
  belongs_to :tipo_reclamo
  belongs_to :user

  def valoracion
  	ReclamoUsuario.where(:reclamo_id => self.id).count
  end

  def valorado user_id
  	ReclamoUsuario.exists?(:reclamo_id => self.id, :user_id => user_id)
  end
end
