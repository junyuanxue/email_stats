class Email < ActiveRecord::Base
  def self.count_event(event, email_type = nil)
    return group(:event).count[event] unless email_type
    count_event_by_email_type(event, email_type)
  end

  def self.calculate_rate(event, email_type)
    events = count_event(event, email_type)
    emails_sent = count_event('send', email_type)
    to_percentage(events.to_f / emails_sent.to_f)
  end

  private

  def self.count_event_by_email_type(event, email_type)
    group(:event, :email_type).count[[event, email_type]]
  end

  def self.to_percentage(float)
    "#{sprintf('%.2f', float * 100)}%"
  end
end
