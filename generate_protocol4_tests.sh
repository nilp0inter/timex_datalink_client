#!/usr/bin/env bash
# Generate individual golden tests for Protocol 4 models

# Create output directory if it doesn't exist
mkdir -p fixtures/protocol4

# Sync
echo "Generating test: sync"
echo "Command: echo 'TimexDatalinkClient::Protocol4::Sync.new' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol4/sync.jsonl"
echo "TimexDatalinkClient::Protocol4::Sync.new" | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol4/sync.jsonl
echo "Generated output:"
cat fixtures/protocol4/sync.jsonl
echo "----------------------------------------"

# Start
echo "Generating test: start"
echo "Command: echo 'TimexDatalinkClient::Protocol4::Start.new' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol4/start.jsonl"
echo "TimexDatalinkClient::Protocol4::Start.new" | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol4/start.jsonl
echo "Generated output:"
cat fixtures/protocol4/start.jsonl
echo "----------------------------------------"

# End
echo "Generating test: end"
echo "Command: echo 'TimexDatalinkClient::Protocol4::End.new' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol4/end.jsonl"
echo "TimexDatalinkClient::Protocol4::End.new" | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol4/end.jsonl
echo "Generated output:"
cat fixtures/protocol4/end.jsonl
echo "----------------------------------------"

# Time (non-24h)
echo "Generating test: time_12h"
echo "Command: echo 'TimexDatalinkClient::Protocol4::Time.new(zone: 1, name: \"PDT\", time: Time.new(2022, 9, 5, 3, 39, 44), is_24h: false, date_format: \"%_m-%d-%y\")' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol4/time_12h.jsonl"
echo 'TimexDatalinkClient::Protocol4::Time.new(zone: 1, name: "PDT", time: Time.new(2022, 9, 5, 3, 39, 44), is_24h: false, date_format: "%_m-%d-%y")' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol4/time_12h.jsonl
echo "Generated output:"
cat fixtures/protocol4/time_12h.jsonl
echo "----------------------------------------"

# Time (24h)
echo "Generating test: time_24h"
echo "Command: echo 'TimexDatalinkClient::Protocol4::Time.new(zone: 2, name: \"GMT\", time: Time.new(2022, 9, 5, 11, 39, 44), is_24h: true, date_format: \"%_m-%d-%y\")' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol4/time_24h.jsonl"
echo 'TimexDatalinkClient::Protocol4::Time.new(zone: 2, name: "GMT", time: Time.new(2022, 9, 5, 11, 39, 44), is_24h: true, date_format: "%_m-%d-%y")' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol4/time_24h.jsonl
echo "Generated output:"
cat fixtures/protocol4/time_24h.jsonl
echo "----------------------------------------"

# Alarm (basic)
echo "Generating test: alarm_basic"
echo "Command: echo 'TimexDatalinkClient::Protocol4::Alarm.new(number: 1, audible: true, time: Time.new(0, 1, 1, 9, 0), message: \"Wake up\")' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol4/alarm_basic.jsonl"
echo 'TimexDatalinkClient::Protocol4::Alarm.new(number: 1, audible: true, time: Time.new(0, 1, 1, 9, 0), message: "Wake up")' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol4/alarm_basic.jsonl
echo "Generated output:"
cat fixtures/protocol4/alarm_basic.jsonl
echo "----------------------------------------"

# Alarm (silent)
echo "Generating test: alarm_silent"
echo "Command: echo 'TimexDatalinkClient::Protocol4::Alarm.new(number: 3, audible: false, time: Time.new(0, 1, 1, 9, 10), message: \"Get up\")' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol4/alarm_silent.jsonl"
echo 'TimexDatalinkClient::Protocol4::Alarm.new(number: 3, audible: false, time: Time.new(0, 1, 1, 9, 10), message: "Get up")' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol4/alarm_silent.jsonl
echo "Generated output:"
cat fixtures/protocol4/alarm_silent.jsonl
echo "----------------------------------------"

# Appointment EEPROM
echo "Generating test: appointment"
echo "Command: echo 'TimexDatalinkClient::Protocol4::Eeprom.new(appointments: [TimexDatalinkClient::Protocol4::Eeprom::Appointment.new(time: Time.new(2022, 10, 31, 19, 0), message: \"Scare the neighbors\")])' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol4/appointment.jsonl"
echo 'TimexDatalinkClient::Protocol4::Eeprom.new(appointments: [TimexDatalinkClient::Protocol4::Eeprom::Appointment.new(time: Time.new(2022, 10, 31, 19, 0), message: "Scare the neighbors")])' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol4/appointment.jsonl
echo "Generated output:"
cat fixtures/protocol4/appointment.jsonl
echo "----------------------------------------"

# Anniversary EEPROM
echo "Generating test: anniversary"
echo "Command: echo 'TimexDatalinkClient::Protocol4::Eeprom.new(anniversaries: [TimexDatalinkClient::Protocol4::Eeprom::Anniversary.new(time: Time.new(1985, 7, 3), anniversary: \"Release of Back to the Future\")])' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol4/anniversary.jsonl"
echo 'TimexDatalinkClient::Protocol4::Eeprom.new(anniversaries: [TimexDatalinkClient::Protocol4::Eeprom::Anniversary.new(time: Time.new(1985, 7, 3), anniversary: "Release of Back to the Future")])' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol4/anniversary.jsonl
echo "Generated output:"
cat fixtures/protocol4/anniversary.jsonl
echo "----------------------------------------"

# Phone Number EEPROM
echo "Generating test: phone_number"
echo "Command: echo 'TimexDatalinkClient::Protocol4::Eeprom.new(phone_numbers: [TimexDatalinkClient::Protocol4::Eeprom::PhoneNumber.new(name: \"Marty McFly\", number: \"1112223333\", type: \"H\")])' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol4/phone_number.jsonl"
echo 'TimexDatalinkClient::Protocol4::Eeprom.new(phone_numbers: [TimexDatalinkClient::Protocol4::Eeprom::PhoneNumber.new(name: "Marty McFly", number: "1112223333", type: "H")])' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol4/phone_number.jsonl
echo "Generated output:"
cat fixtures/protocol4/phone_number.jsonl
echo "----------------------------------------"

# List Item EEPROM
echo "Generating test: list_item"
echo "Command: echo 'TimexDatalinkClient::Protocol4::Eeprom.new(lists: [TimexDatalinkClient::Protocol4::Eeprom::List.new(list_entry: \"Muffler bearings\", priority: 2)])' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol4/list_item.jsonl"
echo 'TimexDatalinkClient::Protocol4::Eeprom.new(lists: [TimexDatalinkClient::Protocol4::Eeprom::List.new(list_entry: "Muffler bearings", priority: 2)])' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol4/list_item.jsonl
echo "Generated output:"
cat fixtures/protocol4/list_item.jsonl
echo "----------------------------------------"

# Sound Options
echo "Generating test: sound_options"
echo "Command: echo 'TimexDatalinkClient::Protocol4::SoundOptions.new(hourly_chime: true, button_beep: false)' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol4/sound_options.jsonl"
echo 'TimexDatalinkClient::Protocol4::SoundOptions.new(hourly_chime: true, button_beep: false)' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol4/sound_options.jsonl
echo "Generated output:"
cat fixtures/protocol4/sound_options.jsonl
echo "----------------------------------------"

# Sound Theme
# Note: This requires the example SPC file to be present
if [ -f "spec/fixtures/EXAMPLE.SPC" ]; then
  echo "Generating test: sound_theme"
  echo "Command: echo 'TimexDatalinkClient::Protocol4::SoundTheme.new(spc_file: \"spec/fixtures/EXAMPLE.SPC\")' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol4/sound_theme.jsonl"
  echo 'TimexDatalinkClient::Protocol4::SoundTheme.new(spc_file: "spec/fixtures/EXAMPLE.SPC")' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol4/sound_theme.jsonl
  echo "Generated output:"
  cat fixtures/protocol4/sound_theme.jsonl
  echo "----------------------------------------"
else
  echo "Skipping sound_theme test (spec/fixtures/EXAMPLE.SPC not found)"
fi

# WristApp
# Note: This requires the example ZAP file to be present
if [ -f "spec/fixtures/EXAMPLE.ZAP" ]; then
  echo "Generating test: wrist_app"
  echo "Command: echo 'TimexDatalinkClient::Protocol4::WristApp.new(zap_file: \"spec/fixtures/EXAMPLE.ZAP\")' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol4/wrist_app.jsonl"
  echo 'TimexDatalinkClient::Protocol4::WristApp.new(zap_file: "spec/fixtures/EXAMPLE.ZAP")' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol4/wrist_app.jsonl
  echo "Generated output:"
  cat fixtures/protocol4/wrist_app.jsonl
  echo "----------------------------------------"
else
  echo "Skipping wrist_app test (spec/fixtures/EXAMPLE.ZAP not found)"
fi

echo "All Protocol 4 tests generated in fixtures/protocol4/"