#!/usr/bin/env bash
# Generate individual golden tests for Protocol 9 models (Timex Ironman Triathlon)

# Create output directory if it doesn't exist
mkdir -p fixtures/protocol9

# Sync
echo "Generating test: sync"
echo "Command: echo 'TimexDatalinkClient::Protocol9::Sync.new' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol9/sync.jsonl"
echo "TimexDatalinkClient::Protocol9::Sync.new" | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol9/sync.jsonl
echo "Generated output:"
cat fixtures/protocol9/sync.jsonl
echo "----------------------------------------"

# Start
echo "Generating test: start"
echo "Command: echo 'TimexDatalinkClient::Protocol9::Start.new' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol9/start.jsonl"
echo "TimexDatalinkClient::Protocol9::Start.new" | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol9/start.jsonl
echo "Generated output:"
cat fixtures/protocol9/start.jsonl
echo "----------------------------------------"

# End
echo "Generating test: end"
echo "Command: echo 'TimexDatalinkClient::Protocol9::End.new' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol9/end.jsonl"
echo "TimexDatalinkClient::Protocol9::End.new" | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol9/end.jsonl
echo "Generated output:"
cat fixtures/protocol9/end.jsonl
echo "----------------------------------------"

# Time (non-24h)
echo "Generating test: time_12h"
echo "Command: echo 'TimexDatalinkClient::Protocol9::Time.new(zone: 1, time: Time.new(2022, 9, 15, 1, 12, 45), is_24h: false)' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol9/time_12h.jsonl"
echo 'TimexDatalinkClient::Protocol9::Time.new(zone: 1, time: Time.new(2022, 9, 15, 1, 12, 45), is_24h: false)' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol9/time_12h.jsonl
echo "Generated output:"
cat fixtures/protocol9/time_12h.jsonl
echo "----------------------------------------"

# Time (24h)
echo "Generating test: time_24h"
echo "Command: echo 'TimexDatalinkClient::Protocol9::Time.new(zone: 2, time: Time.new(2022, 9, 15, 9, 12, 45), is_24h: true)' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol9/time_24h.jsonl"
echo 'TimexDatalinkClient::Protocol9::Time.new(zone: 2, time: Time.new(2022, 9, 15, 9, 12, 45), is_24h: true)' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol9/time_24h.jsonl
echo "Generated output:"
cat fixtures/protocol9/time_24h.jsonl
echo "----------------------------------------"

# Time Name (zone 1)
echo "Generating test: time_name_zone1"
echo "Command: echo 'TimexDatalinkClient::Protocol9::TimeName.new(zone: 1, name: \"LAX\")' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol9/time_name_zone1.jsonl"
echo 'TimexDatalinkClient::Protocol9::TimeName.new(zone: 1, name: "LAX")' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol9/time_name_zone1.jsonl
echo "Generated output:"
cat fixtures/protocol9/time_name_zone1.jsonl
echo "----------------------------------------"

# Time Name (zone 2)
echo "Generating test: time_name_zone2"
echo "Command: echo 'TimexDatalinkClient::Protocol9::TimeName.new(zone: 2, name: \"LON\")' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol9/time_name_zone2.jsonl"
echo 'TimexDatalinkClient::Protocol9::TimeName.new(zone: 2, name: "LON")' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol9/time_name_zone2.jsonl
echo "Generated output:"
cat fixtures/protocol9/time_name_zone2.jsonl
echo "----------------------------------------"

# Chrono EEPROM
echo "Generating test: chrono"
echo "Command: echo 'TimexDatalinkClient::Protocol9::Eeprom.new(chrono: TimexDatalinkClient::Protocol9::Eeprom::Chrono.new(label: \"CHRONO\", laps: 8))' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol9/chrono.jsonl"
echo 'TimexDatalinkClient::Protocol9::Eeprom.new(chrono: TimexDatalinkClient::Protocol9::Eeprom::Chrono.new(label: "CHRONO", laps: 8))' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol9/chrono.jsonl
echo "Generated output:"
cat fixtures/protocol9/chrono.jsonl
echo "----------------------------------------"

# Timer (stop timer)
echo "Generating test: timer_stop"
echo "Command: echo 'TimexDatalinkClient::Protocol9::Timer.new(number: 1, label: \"TIMER 1\", time: Time.new(0, 1, 1, 0, 5, 0), action_at_end: :stop_timer)' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol9/timer_stop.jsonl"
echo 'TimexDatalinkClient::Protocol9::Timer.new(number: 1, label: "TIMER 1", time: Time.new(0, 1, 1, 0, 5, 0), action_at_end: :stop_timer)' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol9/timer_stop.jsonl
echo "Generated output:"
cat fixtures/protocol9/timer_stop.jsonl
echo "----------------------------------------"

# Timer (repeat timer)
echo "Generating test: timer_repeat"
echo "Command: echo 'TimexDatalinkClient::Protocol9::Timer.new(number: 2, label: \"TIMER 2\", time: Time.new(0, 1, 1, 0, 10, 0), action_at_end: :repeat_timer)' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol9/timer_repeat.jsonl"
echo 'TimexDatalinkClient::Protocol9::Timer.new(number: 2, label: "TIMER 2", time: Time.new(0, 1, 1, 0, 10, 0), action_at_end: :repeat_timer)' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol9/timer_repeat.jsonl
echo "Generated output:"
cat fixtures/protocol9/timer_repeat.jsonl
echo "----------------------------------------"

# Timer (start chrono)
echo "Generating test: timer_chrono"
echo "Command: echo 'TimexDatalinkClient::Protocol9::Timer.new(number: 5, label: \"TIMER 5\", time: Time.new(0, 1, 1, 1, 0, 0), action_at_end: :start_chrono)' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol9/timer_chrono.jsonl"
echo 'TimexDatalinkClient::Protocol9::Timer.new(number: 5, label: "TIMER 5", time: Time.new(0, 1, 1, 1, 0, 0), action_at_end: :start_chrono)' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol9/timer_chrono.jsonl
echo "Generated output:"
cat fixtures/protocol9/timer_chrono.jsonl
echo "----------------------------------------"

# Alarm (basic)
echo "Generating test: alarm_basic"
echo "Command: echo 'TimexDatalinkClient::Protocol9::Alarm.new(number: 1, audible: false, time: Time.new(0, 1, 1, 6, 30), message: \"TALKING AWAY\")' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol9/alarm_basic.jsonl"
echo 'TimexDatalinkClient::Protocol9::Alarm.new(number: 1, audible: false, time: Time.new(0, 1, 1, 6, 30), message: "TALKING AWAY")' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol9/alarm_basic.jsonl
echo "Generated output:"
cat fixtures/protocol9/alarm_basic.jsonl
echo "----------------------------------------"

# Alarm (day specific)
echo "Generating test: alarm_day"
echo "Command: echo 'TimexDatalinkClient::Protocol9::Alarm.new(number: 3, audible: true, time: Time.new(0, 1, 1, 8, 30), day: 15, message: \"TO SAY ILL SAY\")' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol9/alarm_day.jsonl"
echo 'TimexDatalinkClient::Protocol9::Alarm.new(number: 3, audible: true, time: Time.new(0, 1, 1, 8, 30), day: 15, message: "TO SAY ILL SAY")' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol9/alarm_day.jsonl
echo "Generated output:"
cat fixtures/protocol9/alarm_day.jsonl
echo "----------------------------------------"

# Alarm (date specific)
echo "Generating test: alarm_date"
echo "Command: echo 'TimexDatalinkClient::Protocol9::Alarm.new(number: 4, audible: false, time: Time.new(0, 1, 1, 9, 35), month: 9, day: 14, message: \"IT ANYWAY\")' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol9/alarm_date.jsonl"
echo 'TimexDatalinkClient::Protocol9::Alarm.new(number: 4, audible: false, time: Time.new(0, 1, 1, 9, 35), month: 9, day: 14, message: "IT ANYWAY")' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol9/alarm_date.jsonl
echo "Generated output:"
cat fixtures/protocol9/alarm_date.jsonl
echo "----------------------------------------"

# Phone Number EEPROM
echo "Generating test: phone_number"
echo "Command: echo 'TimexDatalinkClient::Protocol9::Eeprom.new(phone_numbers: [TimexDatalinkClient::Protocol9::Eeprom::PhoneNumber.new(name: \"Doc Brown\", number: \"1112223333\", type: \"C\")])' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol9/phone_number.jsonl"
echo 'TimexDatalinkClient::Protocol9::Eeprom.new(phone_numbers: [TimexDatalinkClient::Protocol9::Eeprom::PhoneNumber.new(name: "Doc Brown", number: "1112223333", type: "C")])' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol9/phone_number.jsonl
echo "Generated output:"
cat fixtures/protocol9/phone_number.jsonl
echo "----------------------------------------"

# Sound Options
echo "Generating test: sound_options"
echo "Command: echo 'TimexDatalinkClient::Protocol9::SoundOptions.new(hourly_chime: true, button_beep: false)' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol9/sound_options.jsonl"
echo 'TimexDatalinkClient::Protocol9::SoundOptions.new(hourly_chime: true, button_beep: false)' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol9/sound_options.jsonl
echo "Generated output:"
cat fixtures/protocol9/sound_options.jsonl
echo "----------------------------------------"

echo "All Protocol 9 tests generated in fixtures/protocol9/"