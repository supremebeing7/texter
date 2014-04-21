require 'spec_helper'

describe Message do
  it { should validate_presence_of :body }
  it { should validate_presence_of :to }
  it { should validate_presence_of :from }
  it "doesn't save the message if twilio gives an error" do
    message = Message.new(:body => 'hi', :to => '111111', :from => '15005550006')
    message.save.should be_false
  end
end
