require "./ticket_vending_system"
require "./ride"

rides = [
  { name: "roller coaster", fee: 1200 },
  { name: "merry-go-round", fee: 1000 },
  { name: "jackie coaster", fee: 800 }
]

rides_info = rides.map { |b| Ride.new(b[:name], b[:fee]) }
TicketVendingSystem.new(rides_info).exec_transaction