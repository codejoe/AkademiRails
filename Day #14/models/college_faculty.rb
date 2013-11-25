class CollegeFaculty < ActiveRecord::Base
  has_many   :college_faculty_majors 
  belongs_to :college
  belongs_to :faculty
end
