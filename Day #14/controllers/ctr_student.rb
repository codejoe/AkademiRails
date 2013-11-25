# Student
get '/students' do  
  @students = Student.all
  erb :index
end