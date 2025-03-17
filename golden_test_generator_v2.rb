#!/usr/bin/env ruby
# frozen_string_literal: true

require "json"
require "timex_datalink_client"

# This is an improved version of the golden test generator that properly handles
# EEPROM elements by wrapping them in an EEPROM object when needed.

# Store regular models and EEPROM components separately
models = []
eeprom_components = {
  "Protocol1" => {
    appointments: [],
    anniversaries: [],
    phone_numbers: [],
    lists: []
  },
  "Protocol3" => {
    appointments: [],
    anniversaries: [],
    phone_numbers: [],
    lists: []
  },
  "Protocol4" => {
    appointments: [],
    anniversaries: [],
    phone_numbers: [],
    lists: []
  },
  "Protocol6" => {
    phone_numbers: []
  },
  "Protocol7" => {
    activities: [],
    phone_numbers: [],
    speech: nil,
    games: nil,
    calendar: nil
  },
  "Protocol9" => {
    phone_numbers: [],
    chrono: nil
  }
}

# Helper to check if a model is an EEPROM component
def eeprom_component?(model)
  class_name = model.class.name
  return false unless class_name.include?("Eeprom::")
  
  # Direct EEPROM models like Protocol7::Eeprom::Calendar aren't components
  # They're already wrapper models that generate packets
  return false if model.respond_to?(:packets)
  
  true
end

# Helper to determine the protocol from a class name
def extract_protocol(class_name)
  if class_name =~ /Protocol(\d+)/
    "Protocol#{$1}"
  else
    nil
  end
end

# Read from stdin line by line
STDIN.each_line do |line|
  # Skip empty lines and comments
  next if line.strip.empty? || line.strip.start_with?("#")
  
  # Evaluate each line, which creates a model
  begin
    model = eval(line.strip)
    
    if eeprom_component?(model)
      # It's an EEPROM component, add it to the appropriate collection
      protocol = extract_protocol(model.class.name)
      if protocol
        component_type = model.class.name.split("::").last.downcase.to_sym
        
        # Special handling for different component types
        if component_type == :calendar || component_type == :games || component_type == :speech || component_type == :chrono
          eeprom_components[protocol][component_type] = model
        else
          # Collections like appointments, phone_numbers, etc.
          plural_type = "#{component_type}s".to_sym
          eeprom_components[protocol][plural_type] << model if eeprom_components[protocol].key?(plural_type)
        end
      end
    else
      # Regular model that has its own packets method
      models << model
    end
  rescue => e
    STDERR.puts "Error evaluating line: #{line.strip}"
    STDERR.puts e.message
  end
end

# Create and add EEPROM models for each protocol if any components were defined
eeprom_components.each do |protocol, components|
  next if components.values.all? { |v| v.nil? || (v.respond_to?(:empty?) && v.empty?) }
  
  # Create args hash with only non-empty components
  args = {}
  components.each do |key, value|
    next if value.nil? || (value.respond_to?(:empty?) && value.empty?)
    args[key] = value
  end
  
  # Skip if no args (shouldn't happen due to the check above)
  next if args.empty?
  
  # Create the appropriate EEPROM model
  begin
    eeprom_model = Object.const_get("TimexDatalinkClient::#{protocol}::Eeprom").new(**args)
    models << eeprom_model
  rescue => e
    STDERR.puts "Error creating EEPROM model for #{protocol}: #{e.message}"
  end
end

# For each model, output its packets as JSON
models.each do |model|
  begin
    packets = model.packets
    packets.each do |packet|
      # Output each packet as a JSON array (it's already an array of bytes)
      puts JSON.generate(packet)
    end
  rescue => e
    STDERR.puts "Error getting packets from #{model.class.name}"
    STDERR.puts e.message
  end
end