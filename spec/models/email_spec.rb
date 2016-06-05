require 'rails_helper'

describe Email, type: :model do
  describe 'count_total' do
    before do
      3.times { FactoryGirl.create(:email, event: 'send') }
      2.times { FactoryGirl.create(:email, event: 'open') }
      1.times { FactoryGirl.create(:email, event: 'click') }
    end

    it 'counts total number of emails sent' do
      expect(Email.count_total('send')).to eq 3
    end

    it 'counts total number of emails opened' do
      expect(Email.count_total('open')).to eq 2
    end

    it 'counts total number of emails clicked' do
      expect(Email.count_total('click')).to eq 1
    end
  end

  describe 'calculate_rate' do
    it 'calculates the open rate per email type' do
      2.times { FactoryGirl.create(:email, email_type: 'Order', event: 'open') }
      3.times { FactoryGirl.create(:email, email_type: 'Order', event: 'send') }
      expect(Email.calculate_rate('open', 'Order')).to eq '40%'
    end
  end
end
