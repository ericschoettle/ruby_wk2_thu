class Contacts
attr_reader(:first_name, :last_name, :job, :company)
  @@contacts = []

  define_method(:initialize) do |attributes|
    @first_name = attributes.fetch(:first_name)
    @last_name =attributes.fetch(:last_name)
    @job = attributes.fetch(:job)
    @company = attributes.fetch(:company)
    @id = @@contacts.length.+(1)
  end

  define_singleton_method(:clear) do
    @@contacts = []
  end

  define_singleton_method(:all) do
    @@contacts
  end

  define_method(:save) do
    @@contacts.push(self)
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:find) do |id|
    result = []
    @@contacts.each() do |contact|
      if contact.id() == id
        result = contact
      end
    end
    result
  end
end
