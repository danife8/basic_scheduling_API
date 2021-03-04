# == Schema Information
#
# Table name: courses
#
#  id          :bigint           not null, primary key
#  code        :string
#  title       :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Course < ApplicationRecord
  # concerns
  include Searchable

  # validations
  validates :code, presence: true, uniqueness: true
  validates :title, presence: true, uniqueness: true

  # relations
  has_many :inscriptions
  has_many :students, through: :inscriptions
end
