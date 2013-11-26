# College
get '/' do  
  @colleges = College.all
  erb :'college/index'
end

get '/college' do  
  @colleges = College.all
  erb :'college/index'
end

get '/college/new' do  
  @colleges = College.all
  erb :'college/new'
end

post '/college/new' do  
  @college = College.create(name: params[:name])
  if @college.new_record?
     erb :'college/new'
  else
    redirect to('/college')
  end
end 

delete '/college/:id' do
  College.all.find(params[:id]).destroy
  redirect to('/college')
end

get '/college/:id/edit' do
  @college = College.all.find_by_id params[:id]
  erb :'college/edit'
end

put '/college/:id' do |id|
  college = College.all.find_by_id params[:id]
  if college.update_attributes name: params[:name]
    redirect to('/college')
  else
    redirect to('/college/edit')
  end
end