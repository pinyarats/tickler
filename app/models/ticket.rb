class Ticket < ActiveRecord::Base
  attr_accessible :citation_number, :location, :license_number, :fine_amount, :filepicker_url, :status, :issued_at
  belongs_to :user
  
  STATUS_PENDING = "pending"
  STATUS_IN_DISPUTE = "in_dispute"
  STATUS_PENALTY = "penalty"
  STATUS_CLOSED = "closed"
end
