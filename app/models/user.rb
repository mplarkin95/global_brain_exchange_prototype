class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :meta, polymorphic: true
  validates :meta_type , presence: true

  def self.is_owner?(current_user,meta_object)
    if current_user.meta == meta_object
      return true
    else
      return false
    end
  end
end
