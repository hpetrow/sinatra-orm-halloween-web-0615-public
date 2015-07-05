class HousesController < HalloweenController
  get '/houses' do
    @houses = House.all
    erb :'houses/index'
  end

  get '/houses/new' do
    @candies = Candy.all
    erb :'houses/new'
  end

  get '/houses/:id' do
    @house = House.find(params[:id])
    erb :'houses/show'
  end

  get '/houses/:id/edit' do
    @house = House.find(params[:id])
  end

  post '/houses' do
    house = House.new(params[:house])
    house.save
    redirect "/houses/#{house.id}"
  end

  patch '/houses/:id/trick-or-treat' do
    house = House.find(params[:id])
    house.give_candy(Kid.find(params[:kid_id]))
    redirect "/houses/#{house.id}"
  end

  patch '/houses/:id' do
    house = House.find(params[:id])
    house.update(params[:house])
    redirect "/houses/#{house.id}"
  end
end
