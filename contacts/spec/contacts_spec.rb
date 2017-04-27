require('rspec')
require('./lib/contacts')


describe('contacts') do
  before() do
    Contacts.clear()
  end

  describe(".clear") do
    it "returns an empty array" do
      test_contact = Contacts.new({:first_name=>"Bill", :last_name=>"Gates", :job=>"billionaire", :company=>"the world"})
      test_contact.save()
      Contacts.clear()
      expect(Contacts.all()).to(eq([]))
    end
  end

  describe(".all") do
    it "returns all contacts" do
      test_contact = Contacts.new({:first_name=>"Bill", :last_name=>"Gates", :job=>"billionaire", :company=>"the world"})
      test_contact.save()
      expect(Contacts.all()).to(eq([test_contact]))
    end
  end

  describe("#save") do
    it "saves a contact to the class variable contacts" do
      test_contact = Contacts.new({:first_name=>"Bill", :last_name=>"Gates", :job=>"billionaire", :company=>"the world"})
      test_contact.save()
      expect(Contacts.all()).to(eq([test_contact]))
    end
  end

  describe("#first_name") do
    it "gives the name of the contact" do
      test_contact = Contacts.new({:first_name=>"Bill", :last_name=>"Gates", :job=>"billionaire", :company=>"the world"})
      expect(test_contact.first_name()).to(eq("Bill"))
    end
  end

  describe(".find") do
    it("returns a contact by its id number") do
      test_contact = Contacts.new({:first_name=>"Bill", :last_name=>"Gates", :job=>"billionaire", :company=>"the world"})
      test_contact.save()
      test_contact2 = Contacts.new({:first_name=>"Melinda", :last_name=>"Gates", :job=>"billionaire", :company=>"the world"})
      test_contact2.save()
      expect(Contacts.find(test_contact.id())).to(eq(test_contact))
    end
  end

  describe("#id") do
    it "returns the contact's id" do
      test_contact = Contacts.new({:first_name=>"Bill", :last_name=>"Gates", :job=>"billionaire", :company=>"the world"})
      expect(test_contact.id()).to(eq(1))
    end
  end
end
