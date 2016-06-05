class EmailsController < ApplicationController
  respond_to :json

  def create
    email = Email.new(email_params)
    respond_with email if email.save
  end

  private

  def email_params
    params.require(:email).permit(:address,
                                  :email_type,
                                  :event,
                                  :timestamp)
  end
end
