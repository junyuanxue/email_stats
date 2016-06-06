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
      1.times { FactoryGirl.create(:email, email_type: 'Order', event: 'clicked') }
      5.times { FactoryGirl.create(:email, email_type: 'Shipment', event: 'send') }
      4.times { FactoryGirl.create(:email, email_type: 'Shipment', event: 'open') }
      3.times { FactoryGirl.create(:email, email_type: 'Shipment', event: 'clicked') }

      visit '/'
    end

    it 'displays open rate per email type' do
      within '.open-rate li' do
        expect(page).to have_content 'Order: 66.67%'
        expect(page).to have_content 'Shipment: 80.00%'
      end
    end
  end
end
