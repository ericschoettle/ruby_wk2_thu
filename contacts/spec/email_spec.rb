require('rspec')
require('./lib/email')

describe('email') do
  before() do
    Email.clear()
  end

  describe(".clear") do
    it "returns an empty array" do
      test_email = Email.new({:email_address=>"bill@msn.com", :type=>"business"})
      test_email.save()
      Email.clear()
      expect(Email.all()).to(eq([]))
    end
  end

  describe("#type") do
    it "returns a type of an email" do
      test_email = Email.new({:email_address=>"bill@msn.com", :type=>"business"})
      expect(test_email.type()).to(eq("business"))
    end
  end

  describe(".find") do
    it "finds an email by ID" do
      test_email = Email.new({:email_address=>"bill@msn.com", :type=>"business"})
      test_email.save()
      test_email2 = Email.new({:email_address=>"paul@msn.com", :type=>"rock'n_roll"})
      test_email2.save()
      expect(Email.find(test_email2.id())).to(eq(test_email2))
    end
  end
end
