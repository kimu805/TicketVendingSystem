require "date"

class TicketVendingSystem

  attr_reader :rides, :created_at

  def initialize
    @ride_info = [
      { name: "roller coaster", fee: 1200 },
      { name: "merry-go-round", fee: 1000 },
      { name: "jackie coaster", fee: 800 }
    ]
    @created_at = Date.today
  end
end

