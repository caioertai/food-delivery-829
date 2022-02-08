require_relative "patient"
require "csv"

class PatientRepository
  def initialize(csv_path, room_repository)
    @csv_path = csv_path
    @room_repository = room_repository
    @patients = []

    load_csv    
  end

  def all
    @patients
  end

  private

  def load_csv
    CSV.foreach(@csv_path, headers: true, header_converters: :symbol) do |row|
      # Typecasting
      row[:cured] = row[:cured] == "true"
      row[:room_id] = row[:room_id].to_i
      
      @patients << Patient.new(
        name: row[:name],
        cured: row[:cured],
        room: @room_repository.find(row[:room_id]) # an instance of a room?
      )
    end
  end
end
