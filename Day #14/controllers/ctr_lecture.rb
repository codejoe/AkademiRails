# Lecture
get '/lecturers' do  
  @lecturers = Lecturer.all
  erb :index
end