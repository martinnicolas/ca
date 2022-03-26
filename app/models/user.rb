class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    
  has_many :user_roles, :foreign_key => 'user_id', :class_name => 'UserRole'
  has_many :roles, :through => :user_roles

  def to_s
  	self.email
  end

  def role?(role)
    return self.roles.find_by(descripcion: role.to_s)
  end
end
