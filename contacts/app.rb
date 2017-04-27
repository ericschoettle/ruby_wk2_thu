require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('capybara')
require('pry')
require('./lib/contacts')
require('./lib/email')

get('/') do
  @contacts = Contacts.all()
  erb(:index)
end

post('/index') do
  new_contact = Contacts.new(params)
  new_contact.save()
  @contacts = Contacts.all()
  erb(:index)
end

get('/contacts/:id') do
  contact_id = params[:id]
  @contact = Contacts.find(contact_id.to_i)
  erb(:contact)
end

post('/contacts/:id') do
  contact_id = params[:id]
  email_address = params[:email_address]
  email_type = params[:email_type]
  email = Email.new(email_address, email_type)
  binding.pry
  @contact = Contacts.find(contact_id.to_i)
  @contact.add_email_address(email)
  erb(:contact)
end
