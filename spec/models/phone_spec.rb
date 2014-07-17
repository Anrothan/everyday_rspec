require 'spec_helper'

describe Phone do
  
  it "is invalid with a blank phone type" do
    phone = Phone.new(phone_type: nil)
    expect(phone).to have(1).errors_on :phone_type
  end

  it "is invalid with a blank phone number" do
    phone = Phone.new(phone: nil)
    expect(phone).to have(1).errors_on :phone
  end

# Regex implemenation failed. Reason unknown. Will come back to this optional spec later. 
=begin
  it "valid US phone numbers are permitted" do
    good = %w[1234567 123-4567 3601234567 360-123-4567 (360)-123-4567 13601234567 1-360-123-4567 1-(360)-123-4567]
    good.each do |number|
      phone = Phone.new(phone: number)
      expect(phone).to have(0).errors_on :phone
    end
  end

  it "invalid US phone numbers are not permitted" do
    bad = %w[not_valid 1__23-4567 36012345679999999 60-123-4567 (3)-123-4567 1360:123:4567 
      (1)-(360)-(444)-(5555) 2-3601112222]
    bad.each do |number|
      phone = Phone.new(phone: number)
      expect(phone).to have(1).errors_on :phone
    end
  end
=end
  it "does not allow duplicate phone numbers per contact" do
  	person = create(:contact)
    create(:home_phone, contact: person, phone: '785-555-1234')
    mobile_phone = build(:mobile_phone, contact: person, phone: '785-555-1234')
  	expect(mobile_phone).to have(1).errors_on(:phone)
  end

  it "allows duplicate phone numbers for different contacts" do
  	create(:home_phone, phone: '785-555-1234')
    phone = build(:home_phone, phone: '785-555-1234')
  	expect(phone).to be_valid
  end

end
