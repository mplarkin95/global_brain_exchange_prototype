class Student < ApplicationRecord
	has_one :user, as: :meta, dependent: :destroy
	accepts_nested_attributes_for :user
  has_attached_file :propic
  validates_attachment_content_type :propic, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
