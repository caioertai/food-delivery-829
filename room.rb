class Room
  attr_accessor :id
  attr_reader :patients

  def initialize(attributes = {})
    @id = attributes[:id]
    @number = attributes[:number]
    @capacity = attributes[:capacity] || 1
  end

  def available?
    @capacity > patients.count
  end
  
  def add_patient(patient)
    raise ArgumentError, "over capacity" unless available?

    @patients << patient
    patient.room = self
  end
end
