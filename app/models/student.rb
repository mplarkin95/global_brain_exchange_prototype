class Student < ApplicationRecord
	has_one :user, as: :meta, dependent: :destroy
	accepts_nested_attributes_for :user
  has_attached_file :pdf
  validates_format_of :pdf_file_name, :with => %r{\.(pdf)}i
end
