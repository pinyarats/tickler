class Ticket < ActiveRecord::Base
  attr_accessible :citation_number, :issued_at, :user_id
  
  STATUS_PENDING = "pending"
  STATUS_IN_DISPUTE = "in_dispute"
  STATUS_PENALTY = "penalty"
  STATUS_CLOSED = "closed"
end
