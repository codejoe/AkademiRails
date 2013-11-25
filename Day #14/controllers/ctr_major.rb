# Major
get '/majors' do  
  @majors = Major.all
  erb :index
end