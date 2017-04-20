class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :meta, polymorphic: true
  validates :meta_type , presence: true

  def self.is_owner?(current_user_id,meta_type,meta_id)
    u = User.where({meta_type: meta_type, meta_id: meta_id}).take
    if u.id != current_user_id
      return false
    else
      return true
    end
  end
end
