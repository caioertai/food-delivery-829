require "date"

class Patient
  attr_accessor :id, :room

  def initialize(attributes = {})
    @id = attributes[:id]
    @name  = attributes[:name]           # String
    @cured = attributes[:cured] || false # boolean
    @room  = attributes[:room]           # Room 
  end

  def cured?
    @cured
  end
end
