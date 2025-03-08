#!/usr/bin/env /Users/jamievandommelen/.rbenv/shims/ruby
require 'date'

class Plant
  attr_accessor :name, :last_watered, :watering_interval

  def initialize(name, last_watered, watering_interval)
    @name = name
    @last_watered = Date.parse(last_watered)  # Last watered date as a string (e.g., "2025-02-20")
    @watering_interval = watering_interval  # Number of days between watering (e.g., 3 days)
  end

  def needs_watering?(current_date)
    days_since_watered = (current_date - @last_watered).to_i
    days_since_watered >= @watering_interval
  end
end

# Example data for plants
plants = [
  Plant.new("Alocasia Nebula", "2025-02-28", 10),  # Needs watering every 10 days
  Plant.new("Tradescantia", "2025-02-28", 9),  # Needs watering every 7 days
  Plant.new("Brasil", "2025-02-28", 9),  # Needs watering every 2 days
]

# Get today's date
today = Date.today



puts "Plants Schedule 🌱 | color=green"
puts "---"
plants.each do |plant|
  if plant.needs_watering?(today)
    puts "#{plant.name} needs watering! | color=red"
  else
    puts "#{plant.name} does not need watering. | color=blue"
  end
end