require 'rails_helper'

describe Email, type: :model do
  describe 'count_event' do
    before do
      3.times { FactoryGirl.create(:email, event: 'send') }
      2.times { FactoryGirl.create(:email, event: 'open') }
      1.times { FactoryGirl.create(:email, event: 'click') }
    end

    it 'counts total number of emails sent' do
      expect(Email.count_event('send')).to eq 3
    end

    it 'counts total number of emails opened' do
      expect(Email.count_event('open')).to eq 2
    end

    it 'counts total number of emails clicked' do
      expect(Email.count_event('click')).to eq 1
    end
  end

  describe 'calculate_rate' do
    it 'calculates the open rate per email type' do
      2.times { FactoryGirl.create(:email, email_type: 'Order', event: 'open') }
      3.times { FactoryGirl.create(:email, email_type: 'Order', event: 'send') }
      expect(Email.calculate_rate('open', 'Order')).to eq '66.67%'
    end

    it 'calculates the click rate per email type' do
      3.times { FactoryGirl.create(:email, email_type: 'Shipment', event: 'click') }
      4.times { FactoryGirl.create(:email, email_type: 'Shipment', event:'send') }
      expect(Email.calculate_rate('click', 'Shipment')).to eq '75.00%'
    end
  end
end
