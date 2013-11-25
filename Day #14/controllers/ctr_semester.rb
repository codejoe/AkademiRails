# Semester
get '/semesters' do  
  @semesters = Semester.all
  erb :index
end