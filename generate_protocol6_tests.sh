#!/usr/bin/env bash
# Generate individual golden tests for Protocol 6 models (Motorola Beepwear Pro)

# Create output directory if it doesn't exist
mkdir -p fixtures/protocol6

# Sync
echo "Generating test: sync"
echo "Command: echo 'TimexDatalinkClient::Protocol6::Sync.new' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol6/sync.jsonl"
echo "TimexDatalinkClient::Protocol6::Sync.new" | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol6/sync.jsonl
echo "Generated output:"
cat fixtures/protocol6/sync.jsonl
echo "----------------------------------------"

# Start
echo "Generating test: start"
echo "Command: echo 'TimexDatalinkClient::Protocol6::Start.new' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol6/start.jsonl"
echo "TimexDatalinkClient::Protocol6::Start.new" | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol6/start.jsonl
echo "Generated output:"
cat fixtures/protocol6/start.jsonl
echo "----------------------------------------"

# End
echo "Generating test: end"
echo "Command: echo 'TimexDatalinkClient::Protocol6::End.new' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol6/end.jsonl"
echo "TimexDatalinkClient::Protocol6::End.new" | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol6/end.jsonl
echo "Generated output:"
cat fixtures/protocol6/end.jsonl
echo "----------------------------------------"

# Time (non-24h)
echo "Generating test: time_12h"
echo "Command: echo 'TimexDatalinkClient::Protocol6::Time.new(zone: 1, time: Time.new(2022, 9, 5, 3, 39, 44), is_24h: false, date_format: \"%_m-%d-%y\")' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol6/time_12h.jsonl"
echo 'TimexDatalinkClient::Protocol6::Time.new(zone: 1, time: Time.new(2022, 9, 5, 3, 39, 44), is_24h: false, date_format: "%_m-%d-%y")' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol6/time_12h.jsonl
echo "Generated output:"
cat fixtures/protocol6/time_12h.jsonl
echo "----------------------------------------"

# Time (24h)
echo "Generating test: time_24h"
echo "Command: echo 'TimexDatalinkClient::Protocol6::Time.new(zone: 2, time: Time.new(2022, 9, 5, 11, 39, 44), is_24h: true, date_format: \"%_m-%d-%y\")' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol6/time_24h.jsonl"
echo 'TimexDatalinkClient::Protocol6::Time.new(zone: 2, time: Time.new(2022, 9, 5, 11, 39, 44), is_24h: true, date_format: "%_m-%d-%y")' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol6/time_24h.jsonl
echo "Generated output:"
cat fixtures/protocol6/time_24h.jsonl
echo "----------------------------------------"

# Time (flex time)
echo "Generating test: time_flex"
echo "Command: echo 'TimexDatalinkClient::Protocol6::Time.new(zone: 2, flex_time: true, flex_time_zone: true, is_24h: true, date_format: \"%_m-%d-%y\")' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol6/time_flex.jsonl"
echo 'TimexDatalinkClient::Protocol6::Time.new(zone: 2, flex_time: true, flex_time_zone: true, is_24h: true, date_format: "%_m-%d-%y")' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol6/time_flex.jsonl
echo "Generated output:"
cat fixtures/protocol6/time_flex.jsonl
echo "----------------------------------------"

# Alarm (basic)
echo "Generating test: alarm_basic"
echo "Command: echo 'TimexDatalinkClient::Protocol6::Alarm.new(number: 1, status: :armed, message: \"State-of-the-art\", time: Time.new(0, 1, 1, 6, 30))' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol6/alarm_basic.jsonl"
echo 'TimexDatalinkClient::Protocol6::Alarm.new(number: 1, status: :armed, message: "State-of-the-art", time: Time.new(0, 1, 1, 6, 30))' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol6/alarm_basic.jsonl
echo "Generated output:"
cat fixtures/protocol6/alarm_basic.jsonl
echo "----------------------------------------"

# Alarm (day specific)
echo "Generating test: alarm_day"
echo "Command: echo 'TimexDatalinkClient::Protocol6::Alarm.new(number: 2, status: :disarmed, message: \"900 MHz\", day: 4, time: Time.new(0, 1, 1, 7, 0))' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol6/alarm_day.jsonl"
echo 'TimexDatalinkClient::Protocol6::Alarm.new(number: 2, status: :disarmed, message: "900 MHz", day: 4, time: Time.new(0, 1, 1, 7, 0))' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol6/alarm_day.jsonl
echo "Generated output:"
cat fixtures/protocol6/alarm_day.jsonl
echo "----------------------------------------"

# Alarm (unused)
echo "Generating test: alarm_unused"
echo "Command: echo 'TimexDatalinkClient::Protocol6::Alarm.new(number: 3, status: :unused)' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol6/alarm_unused.jsonl"
echo 'TimexDatalinkClient::Protocol6::Alarm.new(number: 3, status: :unused)' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol6/alarm_unused.jsonl
echo "Generated output:"
cat fixtures/protocol6/alarm_unused.jsonl
echo "----------------------------------------"

# Alarm (date specific)
echo "Generating test: alarm_date"
echo "Command: echo 'TimexDatalinkClient::Protocol6::Alarm.new(number: 4, status: :armed, message: \"FLEX\", month: 7, day: 4, time: Time.new(0, 1, 1, 6, 30))' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol6/alarm_date.jsonl"
echo 'TimexDatalinkClient::Protocol6::Alarm.new(number: 4, status: :armed, message: "FLEX", month: 7, day: 4, time: Time.new(0, 1, 1, 6, 30))' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol6/alarm_date.jsonl
echo "Generated output:"
cat fixtures/protocol6/alarm_date.jsonl
echo "----------------------------------------"

# Phone Number EEPROM
echo "Generating test: phone_number"
echo "Command: echo 'TimexDatalinkClient::Protocol6::Eeprom.new(phone_numbers: [TimexDatalinkClient::Protocol6::Eeprom::PhoneNumber.new(name: \"Doc Brown\", number: \"1112223333\", type: \"C\")])' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol6/phone_number.jsonl"
echo 'TimexDatalinkClient::Protocol6::Eeprom.new(phone_numbers: [TimexDatalinkClient::Protocol6::Eeprom::PhoneNumber.new(name: "Doc Brown", number: "1112223333", type: "C")])' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol6/phone_number.jsonl
echo "Generated output:"
cat fixtures/protocol6/phone_number.jsonl
echo "----------------------------------------"

# Pager Options
echo "Generating test: pager_options"
echo "Command: echo 'TimexDatalinkClient::Protocol6::PagerOptions.new(auto_on_off: true, on_hour: 6, on_minute: 15, off_hour: 22, off_minute: 45, alert_sound: 4)' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol6/pager_options.jsonl"
echo 'TimexDatalinkClient::Protocol6::PagerOptions.new(auto_on_off: true, on_hour: 6, on_minute: 15, off_hour: 22, off_minute: 45, alert_sound: 4)' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol6/pager_options.jsonl
echo "Generated output:"
cat fixtures/protocol6/pager_options.jsonl
echo "----------------------------------------"

# Night Mode Options
echo "Generating test: night_mode_options"
echo "Command: echo 'TimexDatalinkClient::Protocol6::NightModeOptions.new(night_mode_deactivate_hours: 6, indiglo_timeout_seconds: 10, night_mode_on_notification: true)' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol6/night_mode_options.jsonl"
echo 'TimexDatalinkClient::Protocol6::NightModeOptions.new(night_mode_deactivate_hours: 6, indiglo_timeout_seconds: 10, night_mode_on_notification: true)' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol6/night_mode_options.jsonl
echo "Generated output:"
cat fixtures/protocol6/night_mode_options.jsonl
echo "----------------------------------------"

# Sound Scroll Options
echo "Generating test: sound_scroll_options"
echo "Command: echo 'TimexDatalinkClient::Protocol6::SoundScrollOptions.new(hourly_chime: true, button_beep: false, scroll_speed: 2)' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol6/sound_scroll_options.jsonl"
echo 'TimexDatalinkClient::Protocol6::SoundScrollOptions.new(hourly_chime: true, button_beep: false, scroll_speed: 2)' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol6/sound_scroll_options.jsonl
echo "Generated output:"
cat fixtures/protocol6/sound_scroll_options.jsonl
echo "----------------------------------------"

echo "All Protocol 6 tests generated in fixtures/protocol6/"