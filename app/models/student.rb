# == Schema Information
#
# Table name: students
#
#  id         :bigint           not null, primary key
#  student_id :string
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Student < ApplicationRecord
  # concerns
  include Searchable

  # validations
  validates :student_id, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  # relations
  has_many :inscriptions
  has_many :courses, through: :inscriptions
end
