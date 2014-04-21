require 'spec_helper'

describe Message do
  context 'sending' do
    it 'allows a user to send a text' do
      visit messages_path
      click_link "Send a message"

    end
  end
end
