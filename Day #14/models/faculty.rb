class Faculty < ActiveRecord::Base
  has_many :college_faculty_majors
  has_many :majors, through: :college_faculty_majors
  has_many :college_faculties
  has_many :colleges, through: :college_faculties
end
