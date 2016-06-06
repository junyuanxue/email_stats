class Email < ActiveRecord::Base
  def self.count_event(event)
    group(:event).count[event]
  end

  def self.calculate_rate(event, email_type)
    events = count_event_by_email_type(event, email_type)
    emails = count_by_email_type(email_type)
    to_percentage(events.to_f / emails.to_f)
  end

  private

  def self.count_event_by_email_type(event, email_type)
    group(:event, :email_type).count[[event, email_type]]
  end

  def self.count_by_email_type(email_type)
    group(:email_type).count[email_type]
  end

  def self.to_percentage(float)
    "#{sprintf('%.2f', float*100)}%"
  end
end
