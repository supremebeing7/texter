class Message < ActiveRecord::Base
  before_create :send_message

  validates_presence_of :from
  validates_presence_of :to
  validates_presence_of :body


private

  def send_message
    response = RestClient::Request.new(
      :method => :post,
      :url => "https://api.twilio.com/2010-04-01/Accounts/#{ENV['TWILIO_ACCOUNT_SID']}/Messages.json",
      :user => ENV['TWILIO_ACCOUNT_SID'],
      :password => ENV['TWILIO_AUTH_TOKEN'],
      :payload => { :Body => body,
                    :To => to,
                    :From => from }
    ).execute
  end
end

#     response = RestClient::Request.new(
#   :method => :post,
#   :url => 'https://api.twilio.com/2010-04-01/Accounts/AC5a7ef1f080ae80ff763fd4fef562f77b/Messages.json',
#   :user => 'AC5a7ef1f080ae80ff763fd4fef562f77b',
#   :password => '78f2649b57b5130b96d89655240a2e90',
#   :payload => {  :Body => 'Hello World',
#               :From => '15005550006',
#               :To => '13109076275' }
# ).execute
