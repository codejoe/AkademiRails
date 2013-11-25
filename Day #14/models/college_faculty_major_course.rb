class CollegeFacultyMajorCourse < ActiveRecord::Base
 has_many   :student_courses
 belongs_to :semester
 belongs_to :course
 belongs_to :college_faculty_major 
end