class Ticket < ActiveRecord::Base
  attr_accessible :citation_number, :issued_at, :user_id
end
