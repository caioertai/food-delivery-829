require_relative "room"
require "csv"

class RoomRepository
  def initialize(csv_path)
    @csv_path = csv_path
    @rooms = []

    load_csv    
  end

  def next_id
    @rooms.last.id + 1
  end

  def add(room)
    room.id = next_id
    @rooms << room
  end

  def find(id)
    @rooms.find { |room| room.id = id }
  end

  private

  def load_csv
    CSV.foreach(@csv_path, headers: true, header_converters: :symbol) do |row|
      # Typecasting
      row[:id] = row[:id].to_i
      row[:number] = row[:number].to_i
      row[:capacity] = row[:capacity].to_i
      
      @rooms << Room.new(id: row[:id], number: row[:number], capacity: row[:capacity])
    end
  end
end
