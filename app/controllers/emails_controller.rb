require 'json'

class EmailsController < ApplicationController
  respond_to :json
  skip_before_filter  :verify_authenticity_token

  def create
    JSON.load(request.body)
    email = Email.new(email_params)
    respond_with email if email.save
  end

  private

  def email_params
    
    # params.require(:email).permit(:address,
    #                               :email_type,
    #                               :event,
    #                               :timestamp)
  end
end
