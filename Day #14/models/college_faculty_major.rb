class CollegeFacultyMajor < ActiveRecord::Base
  has_one :faculty, through: :college
  has_many   :college_faculty_major_courses
  has_many   :courses, through: :college_faculty_major_courses
  belongs_to :college_faculty 
  belongs_to :major
end
