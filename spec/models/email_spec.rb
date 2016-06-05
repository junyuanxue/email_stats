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
  end
end
