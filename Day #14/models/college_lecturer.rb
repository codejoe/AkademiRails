class CollegeLecturer < ActiveRecord::Base
  belongs_to :college 
  belongs_to :lecturer
end