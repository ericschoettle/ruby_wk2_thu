require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('capybara')
require('pry')
require('lib/contacts')

get('/') do
  erb(:index)
end
 
