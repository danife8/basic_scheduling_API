class Inscription < ApplicationRecord
  # validations
  validates :course, uniqueness: { scope: :student }

  # relations
  belongs_to :course
  belongs_to :student
end
