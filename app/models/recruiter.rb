class Recruiter < ApplicationRecord
	has_one :user, as: :meta, dependent: :destroy
  has_attached_file :propic, :default_url => 'blank.png'
	accepts_nested_attributes_for :user
  validates_attachment_content_type :propic, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	serialize :search_preferences

end
