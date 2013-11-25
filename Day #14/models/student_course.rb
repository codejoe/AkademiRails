class StudentCourse < ActiveRecord::Base
  belongs_to :student
  belongs_to :college_faculty_major_course
end
