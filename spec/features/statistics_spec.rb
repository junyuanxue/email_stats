require 'rails_helper'

describe 'display email statistics' do
  describe 'displays email count by event' do
    before do
      3.times { FactoryGirl.create(:email, event: 'send') }
      2.times { FactoryGirl.create(:email, event: 'open') }
      1.times { FactoryGirl.create(:email, event: 'click') }

      visit '/'
    end

    it 'displays total number of emails sent' do
      expect(page).to have_content 'Sent: 3'
    end

    it 'displays total number of emails opened' do
      expect(page).to have_content 'Opened: 2'
    end

    it 'displays total number of emails clicked' do
      expect(page).to have_content 'Clicked: 1'
    end
  end

end
