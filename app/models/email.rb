class Email < ActiveRecord::Base
  def self.count_total(event)
    group(:event).count[event]
  end

  
end
