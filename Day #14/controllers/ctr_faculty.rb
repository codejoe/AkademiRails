# Faculty
get '/faculties' do  
  @faculties = Faculty.all
  erb :index
end