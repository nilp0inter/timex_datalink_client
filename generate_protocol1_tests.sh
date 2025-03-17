#!/usr/bin/env bash
# Generate individual golden tests for Protocol 1 models

# Create output directory if it doesn't exist
mkdir -p fixtures/protocol1

# Sync
echo "Generating test: sync"
echo "Command: echo 'TimexDatalinkClient::Protocol1::Sync.new' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol1/sync.jsonl"
echo "TimexDatalinkClient::Protocol1::Sync.new" | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol1/sync.jsonl
echo "Generated output:"
cat fixtures/protocol1/sync.jsonl
echo "----------------------------------------"

# Start
echo "Generating test: start"
echo "Command: echo 'TimexDatalinkClient::Protocol1::Start.new' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol1/start.jsonl"
echo "TimexDatalinkClient::Protocol1::Start.new" | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol1/start.jsonl
echo "Generated output:"
cat fixtures/protocol1/start.jsonl
echo "----------------------------------------"

# End
echo "Generating test: end"
echo "Command: echo 'TimexDatalinkClient::Protocol1::End.new' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol1/end.jsonl"
echo "TimexDatalinkClient::Protocol1::End.new" | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol1/end.jsonl
echo "Generated output:"
cat fixtures/protocol1/end.jsonl
echo "----------------------------------------"

# Time (non-24h)
echo "Generating test: time_12h"
echo "Command: echo 'TimexDatalinkClient::Protocol1::Time.new(zone: 1, time: Time.new(2022, 9, 5, 3, 39, 44), is_24h: false)' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol1/time_12h.jsonl"
echo "TimexDatalinkClient::Protocol1::Time.new(zone: 1, time: Time.new(2022, 9, 5, 3, 39, 44), is_24h: false)" | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol1/time_12h.jsonl
echo "Generated output:"
cat fixtures/protocol1/time_12h.jsonl
echo "----------------------------------------"

# Time (24h)
echo "Generating test: time_24h"
echo "Command: echo 'TimexDatalinkClient::Protocol1::Time.new(zone: 2, time: Time.new(2022, 9, 5, 11, 39, 44), is_24h: true)' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol1/time_24h.jsonl"
echo "TimexDatalinkClient::Protocol1::Time.new(zone: 2, time: Time.new(2022, 9, 5, 11, 39, 44), is_24h: true)" | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol1/time_24h.jsonl
echo "Generated output:"
cat fixtures/protocol1/time_24h.jsonl
echo "----------------------------------------"

# Time Name (zone 1)
echo "Generating test: time_name_zone1"
echo "Command: echo 'TimexDatalinkClient::Protocol1::TimeName.new(zone: 1, name: \"PDT\")' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol1/time_name_zone1.jsonl"
echo 'TimexDatalinkClient::Protocol1::TimeName.new(zone: 1, name: "PDT")' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol1/time_name_zone1.jsonl
echo "Generated output:"
cat fixtures/protocol1/time_name_zone1.jsonl
echo "----------------------------------------"

# Time Name (zone 2)
echo "Generating test: time_name_zone2"
echo "Command: echo 'TimexDatalinkClient::Protocol1::TimeName.new(zone: 2, name: \"GMT\")' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol1/time_name_zone2.jsonl"
echo 'TimexDatalinkClient::Protocol1::TimeName.new(zone: 2, name: "GMT")' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol1/time_name_zone2.jsonl
echo "Generated output:"
cat fixtures/protocol1/time_name_zone2.jsonl
echo "----------------------------------------"

# Alarm (basic)
echo "Generating test: alarm_basic"
echo "Command: echo 'TimexDatalinkClient::Protocol1::Alarm.new(number: 1, audible: true, time: Time.new(0, 1, 1, 9, 0), message: \"Wake up\")' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol1/alarm_basic.jsonl"
echo 'TimexDatalinkClient::Protocol1::Alarm.new(number: 1, audible: true, time: Time.new(0, 1, 1, 9, 0), message: "Wake up")' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol1/alarm_basic.jsonl
echo "Generated output:"
cat fixtures/protocol1/alarm_basic.jsonl
echo "----------------------------------------"

# Alarm (silent)
echo "Generating test: alarm_silent"
echo "Command: echo 'TimexDatalinkClient::Protocol1::Alarm.new(number: 3, audible: false, time: Time.new(0, 1, 1, 9, 10), message: \"Get up\")' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol1/alarm_silent.jsonl"
echo 'TimexDatalinkClient::Protocol1::Alarm.new(number: 3, audible: false, time: Time.new(0, 1, 1, 9, 10), message: "Get up")' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol1/alarm_silent.jsonl
echo "Generated output:"
cat fixtures/protocol1/alarm_silent.jsonl
echo "----------------------------------------"

# Alarm (yearly)
echo "Generating test: alarm_yearly"
echo "Command: echo 'TimexDatalinkClient::Protocol1::Alarm.new(number: 4, audible: true, time: Time.new(0, 1, 1, 18, 0), month: 9, day: 18, message: \"Yearly\")' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol1/alarm_yearly.jsonl"
echo 'TimexDatalinkClient::Protocol1::Alarm.new(number: 4, audible: true, time: Time.new(0, 1, 1, 18, 0), month: 9, day: 18, message: "Yearly")' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol1/alarm_yearly.jsonl
echo "Generated output:"
cat fixtures/protocol1/alarm_yearly.jsonl
echo "----------------------------------------"

# Alarm (monthly)
echo "Generating test: alarm_monthly"
echo "Command: echo 'TimexDatalinkClient::Protocol1::Alarm.new(number: 5, audible: false, time: Time.new(0, 1, 1, 14, 0), day: 26, message: \"Monthly\")' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol1/alarm_monthly.jsonl"
echo 'TimexDatalinkClient::Protocol1::Alarm.new(number: 5, audible: false, time: Time.new(0, 1, 1, 14, 0), day: 26, message: "Monthly")' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol1/alarm_monthly.jsonl
echo "Generated output:"
cat fixtures/protocol1/alarm_monthly.jsonl
echo "----------------------------------------"

# Appointment EEPROM
echo "Generating test: appointment"
echo "Command: echo 'TimexDatalinkClient::Protocol1::Eeprom.new(appointments: [TimexDatalinkClient::Protocol1::Eeprom::Appointment.new(time: Time.new(2022, 10, 31, 19, 0), message: \"Scare the neighbors\")])' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol1/appointment.jsonl"
echo 'TimexDatalinkClient::Protocol1::Eeprom.new(appointments: [TimexDatalinkClient::Protocol1::Eeprom::Appointment.new(time: Time.new(2022, 10, 31, 19, 0), message: "Scare the neighbors")])' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol1/appointment.jsonl
echo "Generated output:"
cat fixtures/protocol1/appointment.jsonl
echo "----------------------------------------"

# Anniversary EEPROM
echo "Generating test: anniversary"
echo "Command: echo 'TimexDatalinkClient::Protocol1::Eeprom.new(anniversaries: [TimexDatalinkClient::Protocol1::Eeprom::Anniversary.new(time: Time.new(1985, 7, 3), anniversary: \"Release of Back to the Future\")])' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol1/anniversary.jsonl"
echo 'TimexDatalinkClient::Protocol1::Eeprom.new(anniversaries: [TimexDatalinkClient::Protocol1::Eeprom::Anniversary.new(time: Time.new(1985, 7, 3), anniversary: "Release of Back to the Future")])' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol1/anniversary.jsonl
echo "Generated output:"
cat fixtures/protocol1/anniversary.jsonl
echo "----------------------------------------"

# Phone Number EEPROM
echo "Generating test: phone_number"
echo "Command: echo 'TimexDatalinkClient::Protocol1::Eeprom.new(phone_numbers: [TimexDatalinkClient::Protocol1::Eeprom::PhoneNumber.new(name: \"Marty McFly\", number: \"1112223333\", type: \"H\")])' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol1/phone_number.jsonl"
echo 'TimexDatalinkClient::Protocol1::Eeprom.new(phone_numbers: [TimexDatalinkClient::Protocol1::Eeprom::PhoneNumber.new(name: "Marty McFly", number: "1112223333", type: "H")])' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol1/phone_number.jsonl
echo "Generated output:"
cat fixtures/protocol1/phone_number.jsonl
echo "----------------------------------------"

# List Item EEPROM
echo "Generating test: list_item"
echo "Command: echo 'TimexDatalinkClient::Protocol1::Eeprom.new(lists: [TimexDatalinkClient::Protocol1::Eeprom::List.new(list_entry: \"Muffler bearings\", priority: 2)])' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol1/list_item.jsonl"
echo 'TimexDatalinkClient::Protocol1::Eeprom.new(lists: [TimexDatalinkClient::Protocol1::Eeprom::List.new(list_entry: "Muffler bearings", priority: 2)])' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol1/list_item.jsonl
echo "Generated output:"
cat fixtures/protocol1/list_item.jsonl
echo "----------------------------------------"

echo "All Protocol 1 tests generated in fixtures/protocol1/"