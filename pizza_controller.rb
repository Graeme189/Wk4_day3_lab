require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry-byebug' )

require_relative( './models/pizza_order.rb' )
also_reload('./models/*')

# INDEX
get '/pizza-orders' do
  @orders = PizzaOrder.all()
  erb(:index)
end

# NEW
get '/pizza-orders/new' do
  erb(:new)
end

# SHOW
get '/pizza-orders/:id' do
  @order = PizzaOrder.find(params[:id])
  erb(:show)
end

# CREATE
post '/pizza-orders' do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end

# DELETE
post '/pizza-orders/:id/delete' do
  @order = PizzaOrder.find(params[:id])
  @order.delete()
  redirect "/pizza-orders"
end

# EDIT
get '/pizza-orders/:id/edit' do
  @order = PizzaOrder.find(params[:id])
  erb(:edit)
end

# UPDATE
post '/pizza-orders/:id' do 
  PizzaOrder.new( params ).update
  redirect to '/pizza-orders'
end
