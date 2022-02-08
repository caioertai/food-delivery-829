require "pry-byebug"
require_relative "patient_repository"
require_relative "room_repository"

room_repo = RoomRepository.new("rooms.csv")
patient_repo = PatientRepository.new("patients.csv", room_repo)

p patient_repo.all.first
