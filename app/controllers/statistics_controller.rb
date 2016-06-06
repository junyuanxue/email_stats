class StatisticsController < ApplicationController
  def index
    @email_types = Email.uniq.pluck(:email_type)
  end
end
