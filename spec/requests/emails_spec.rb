require 'rails_helper'

describe 'emails API' do
  describe 'POST /emails' do
    let!(:email) { FactoryGirl.build(:email) }
    let!(:request_headers) { { 'Accept': 'application/json',
                               'Content-Type': 'application/json' } }

    it 'creates a new email' do
      post '/emails',
           set_email_params(email.address,
                            email.email_type,
                            email.event,
                            email.timestamp),
           request_headers

      expect(response.status).to eq 201
      expect(Email.last.address).to eq email.address
      expect(Email.last.email_type).to eq email.email_type
      expect(Email.last.event).to eq email.event
      expect(Email.last.timestamp).to eq email.timestamp
    end
  end
end
