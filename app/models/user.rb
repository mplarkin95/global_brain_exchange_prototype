class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_friendship
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :meta, polymorphic: true
  validates :meta_type , presence: true
  belongs_to :student , -> { where(users: {meta_type: 'Student'}) }, foreign_key: 'meta_id'
  belongs_to :recruiter ,-> { where(users: {meta_type: 'Recruiter'}) }, foreign_key: 'meta_id'

  def self.is_owner?(current_user,meta_object)
    if current_user.meta == meta_object
      return true
    else
      return false
    end
  end



end
