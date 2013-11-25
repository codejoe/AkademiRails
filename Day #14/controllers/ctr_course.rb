# Course
get '/courses' do  
  @courses = Course.all
  erb :index
end