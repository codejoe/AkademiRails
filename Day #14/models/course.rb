class Course < ActiveRecord::Base
  has_many :lecturer_courses
  has_many :lecturers, through: :lecturer_courses

  has_many :college_faculty_major_courses
  has_many :semesters, through: :college_faculty_major_courses

  has_many :college_faculty_major_courses
  has_many :college_faculty_majors, through: :college_faculty_major_courses
end






