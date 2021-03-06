class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :user_id
      t.string  :citation_number
      t.string  :location
      t.string  :license_number
      t.float   :fine_amount
      t.string  :filepicker_url
      
      t.string  :status
      t.timestamp :issued_at

      t.timestamps
    end
  end
end
