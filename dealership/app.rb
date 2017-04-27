require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/vehicle')
require('./lib/dealership')
require('pry')

get('/') do
  erb(:index)
end

post('/dealerships') do
  @dealership = Dealership.new(params)
  @dealership.save()
  @dealerships = Dealership.all()
  erb(:dealerships)
end

get('/dealerships/:id') do
  dealership_id = params.fetch("id").to_i
  @dealership = Dealership.find(dealership_id)
  binding.pry
  erb(:dealerships)
end

post('/new_vehicle') do
  dealer_id = params["dealership_id"].to_i
  params.delete("dealership_id")
  @vehicle = Vehicle.new(params)
  Dealership.add_vehicle(@vehicle)
  @dealerships = Dealership.all()
  @dealership = Dealership.find(dealer_id)
  erb(:dealerships)
end
