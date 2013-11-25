class Lecturer < ActiveRecord::Base
  has_many :lecturer_courses
  has_many :courses, through: :lecturer_courses

  has_many :college_lecturers
  has_many :colleges, through: :college_lecturers
end