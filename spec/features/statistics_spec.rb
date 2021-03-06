require 'rails_helper'

describe 'Email statistics features' do
  describe 'displays email count by event' do
    before do
      3.times { FactoryGirl.create(:email, event: 'send') }
      2.times { FactoryGirl.create(:email, event: 'open') }
      1.times { FactoryGirl.create(:email, event: 'click') }

      visit '/'
    end

    it 'displays total number of emails sent' do
      expect(page).to have_content 'Emails sent: 3'
    end

    it 'displays total number of emails opened' do
      expect(page).to have_content 'Emails opened: 2'
    end

    it 'displays total number of emails clicked' do
      expect(page).to have_content 'Number of clicks: 1'
    end
  end

  describe 'displays open and click rates per email type' do
    before do
      3.times { FactoryGirl.create(:email, email_type: 'Order', event: 'send') }
      2.times { FactoryGirl.create(:email, email_type: 'Order', event: 'open') }
      1.times { FactoryGirl.create(:email, email_type: 'Order', event: 'click') }
      5.times { FactoryGirl.create(:email, email_type: 'Shipment', event: 'send') }
      4.times { FactoryGirl.create(:email, email_type: 'Shipment', event: 'open') }
      3.times { FactoryGirl.create(:email, email_type: 'Shipment', event: 'click') }

      visit '/'
    end

    it 'displays open rate per email type' do
      within '.open-rate' do
        expect(page).to have_content 'Order: 66.67%'
        expect(page).to have_content 'Shipment: 80.00%'
      end
    end

    it 'displays click rate per email type' do
      within '.click-rate' do
        expect(page).to have_content 'Order: 33.33%'
        expect(page).to have_content 'Shipment: 60.00%'
      end
    end
  end
end
