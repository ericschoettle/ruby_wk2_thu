class Email
  attr_accessor(:email_address, :type)
  @@email_addresses = []

  define_method(:initialize) do |email_address, type|
    @email_address = email_address
    @type = type
    @id = @@email_addresses.length() + 1
  end

  define_singleton_method(:clear) do
    @@email_addresses = []
  end

  define_singleton_method(:all) do
    @@email_addresses
  end

  define_method(:save) do
    @@email_addresses.push(self)
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:find) do |id|
    result = []
    @@email_addresses.each() do |email_address|
      if email_address.id() == id
        result = email_address
      end
    end
    result
  end
end
