#!/usr/bin/env ruby
# frozen_string_literal: true

require "json"
require "timex_datalink_client"

# No include needed, we'll use the full module path

# Store models and their source commands
models = []
commands = []

# Read from stdin line by line
STDIN.each_line do |line|
  # Skip empty lines and comments
  next if line.strip.empty? || line.strip.start_with?("#")
  
  # Evaluate each line, which creates a model
  begin
    model = eval(line.strip)
    models << model
    commands << line.strip  # Store the command that created this model
  rescue => e
    STDERR.puts "Error evaluating line: #{line.strip}"
    STDERR.puts e.message
  end
end

# For each model, output its packets as JSON
models.each_with_index do |model, index|
  begin
    # Create a JSON object with the command and all packets
    json_data = {
      command: commands[index],
      class_name: model.class.name,
      packets: model.packets
    }
    
    # Output as JSON lines (no indentation)
    puts JSON.generate(json_data)
  rescue => e
    STDERR.puts "Error getting packets from #{model.class.name}"
    STDERR.puts e.message
  end
end