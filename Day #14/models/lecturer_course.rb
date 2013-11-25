class LecturerCourse < ActiveRecord::Base
  belongs_to :lecturer

  belongs_to :course
  belongs_to :college
end