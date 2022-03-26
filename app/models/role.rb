class Role < ApplicationRecord
	has_many :user_roles, :foreign_key => 'role_id', :class_name => 'UserRole'
  	has_many :users, :through => :user_roles

  	validates :descripcion, :presence => { :message => "Debe completar el campo Descripción" }
end
