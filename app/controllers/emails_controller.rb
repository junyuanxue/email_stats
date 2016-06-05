class EmailsController < ApplicationController

  def create
    Email.create(email_params)
  end

  private

  def email_params
    params.require(:email).permit(:address,
                                  :type,
                                  :event,
                                  :timestamp)
  end
end
