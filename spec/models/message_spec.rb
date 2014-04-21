require 'spec_helper'

describe Message, vcr: true do
  it { should validate_presence_of :body }
  it { should validate_presence_of :to }
  it { should validate_presence_of :from }

  it "doesn't save the message if twilio gives an error" do
    message = Message.new(:body => 'hi', :to => '11111111', :from => '15005550006')
    message.save
    message.errors.messages[:base].should eq ["The 'To' number 11111111 is not a valid phone number."]
  end
end
