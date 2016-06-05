require 'json'
require 'time'

class EmailsController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def create
    email = Email.new(email_params)
    render json: email if email.save
  end

  private

  def email_params
    email = JSON.load(request.body)
    {
      address: email['Address'],
      email_type: email['EmailType'],
      event: email['Event'],
      timestamp: Time.at(email['Timestamp'])
    }
  end
end
