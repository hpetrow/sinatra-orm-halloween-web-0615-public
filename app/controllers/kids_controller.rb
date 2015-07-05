class KidsController < HalloweenController
  get '/kids' do
    @kids = Kid.all
    erb :'kids/index'
  end

  get '/kids/new' do
    erb :'kids/new'
  end

  get '/kids/:id' do
    @kid = Kid.find(params[:id])
    erb :'kids/show'
  end

  post '/kids' do
    kid = Kid.new(params[:kid])
    kid.save
    redirect "/kids/#{kid.id}"
  end

  patch '/kids/:id/pig-out' do
    @kid = Kid.find(params[:id])
    @kid.pig_out(params[:consumption].to_i)
    @kid.reload
    redirect "/kids/#{@kid.id}"
  end
end
