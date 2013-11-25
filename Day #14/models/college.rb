class College < ActiveRecord::Base
  has_many :college_faculties
  has_many :faculties, through: :college_faculties
  has_many :college_lecturers
  has_many :lecturers, through: :college_lecturers

end
