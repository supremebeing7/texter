require 'spec_helper'

describe Message do
  context 'sending' do
    it 'allows a user to send a text' do
      visit messages_path
      click_link "New message"
      page.should have_content 'New Message'
      fill_in 'To', with: '8572641943'
      fill_in 'From', with: '15005550006'
      fill_in 'Body', with: Faker::Lorem.sentence
    end
  end
end
