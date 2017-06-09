class FieldInterest < ApplicationRecord
  belongs_to :student
  validates_uniqueness_of :name, :scope => :student_id
end
