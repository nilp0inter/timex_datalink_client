#!/usr/bin/env bash
# Generate individual golden tests for Protocol 7 models (DSI e-BRAIN)

# Create output directory if it doesn't exist
mkdir -p fixtures/protocol7

# Check if we have pcvocab.mdb for speech features
if [ ! -f "pcvocab.mdb" ]; then
  echo "Warning: pcvocab.mdb not found. Speech-related tests will be skipped."
  echo "See docs/acquiring_pcvocab.mdb.md for information on acquiring this file."
  HAS_VOCAB=false
else
  HAS_VOCAB=true
fi

# Sync
echo "Generating test: sync"
echo "Command: echo 'TimexDatalinkClient::Protocol7::Sync.new' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol7/sync.jsonl"
echo "TimexDatalinkClient::Protocol7::Sync.new" | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol7/sync.jsonl
echo "Generated output:"
cat fixtures/protocol7/sync.jsonl
echo "----------------------------------------"

# Start
echo "Generating test: start"
echo "Command: echo 'TimexDatalinkClient::Protocol7::Start.new' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol7/start.jsonl"
echo "TimexDatalinkClient::Protocol7::Start.new" | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol7/start.jsonl
echo "Generated output:"
cat fixtures/protocol7/start.jsonl
echo "----------------------------------------"

# End
echo "Generating test: end"
echo "Command: echo 'TimexDatalinkClient::Protocol7::End.new' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol7/end.jsonl"
echo "TimexDatalinkClient::Protocol7::End.new" | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol7/end.jsonl
echo "Generated output:"
cat fixtures/protocol7/end.jsonl
echo "----------------------------------------"

# Skip speech-related tests if pcvocab.mdb isn't available
if [ "$HAS_VOCAB" = true ]; then
  # Activities EEPROM
  echo "Generating test: activities"
  echo "Command: echo 'TimexDatalinkClient::Protocol7::Eeprom.new(activities: [TimexDatalinkClient::Protocol7::Eeprom::Activity.new(time: Time.new(0, 1, 1, 7, 30, 0), messages: [[1, 2, 3]], random_speech: false)])' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol7/activities.jsonl"
  echo 'TimexDatalinkClient::Protocol7::Eeprom.new(activities: [TimexDatalinkClient::Protocol7::Eeprom::Activity.new(time: Time.new(0, 1, 1, 7, 30, 0), messages: [[1, 2, 3]], random_speech: false)])' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol7/activities.jsonl
  echo "Generated output:"
  cat fixtures/protocol7/activities.jsonl
  echo "----------------------------------------"

  # Games EEPROM
  echo "Generating test: games"
  games_cmd="TimexDatalinkClient::Protocol7::Eeprom.new(games: TimexDatalinkClient::Protocol7::Eeprom::Games.new(memory_game_enabled: true, fortune_teller_enabled: false, countdown_timer_enabled: true, countdown_timer_seconds: 90, countdown_timer_sound: 42, mind_reader_enabled: false, music_time_keeper_enabled: true, music_time_keeper_sound: 50, morse_code_practice_enabled: false, treasure_hunter_enabled: true, rhythm_rhyme_buster_enabled: false, stop_watch_enabled: true, red_light_green_light_enabled: false))"
  echo "Command: echo '$games_cmd' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol7/games.jsonl"
  echo "$games_cmd" | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol7/games.jsonl
  echo "Generated output:"
  cat fixtures/protocol7/games.jsonl
  echo "----------------------------------------"

  # Calendar EEPROM
  echo "Generating test: calendar"
  calendar_cmd="TimexDatalinkClient::Protocol7::Eeprom.new(calendar: TimexDatalinkClient::Protocol7::Eeprom::Calendar.new(time: Time.new(2022, 12, 11, 17, 50, 2), events: [TimexDatalinkClient::Protocol7::Eeprom::Calendar::Event.new(time: Time.new(2022, 12, 13, 9, 0, 0), phrase: [10, 20, 30])]))"
  echo "Command: echo '$calendar_cmd' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol7/calendar.jsonl"
  echo "$calendar_cmd" | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol7/calendar.jsonl
  echo "Generated output:"
  cat fixtures/protocol7/calendar.jsonl
  echo "----------------------------------------"

  # Phone Numbers EEPROM
  echo "Generating test: phone_number"
  echo "Command: echo 'TimexDatalinkClient::Protocol7::Eeprom.new(phone_numbers: [TimexDatalinkClient::Protocol7::Eeprom::PhoneNumber.new(name: [5, 6, 7], number: \"8675309\")])' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol7/phone_number.jsonl"
  echo 'TimexDatalinkClient::Protocol7::Eeprom.new(phone_numbers: [TimexDatalinkClient::Protocol7::Eeprom::PhoneNumber.new(name: [5, 6, 7], number: "8675309")])' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol7/phone_number.jsonl
  echo "Generated output:"
  cat fixtures/protocol7/phone_number.jsonl
  echo "----------------------------------------"

  # Speech EEPROM
  echo "Generating test: speech"
  echo "Command: echo 'TimexDatalinkClient::Protocol7::Eeprom.new(speech: TimexDatalinkClient::Protocol7::Eeprom::Speech.new(device_nickname: [1, 2, 3], user_nickname: [4, 5, 6], phrases: [[7, 8, 9], [10, 11, 12]]))' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol7/speech.jsonl"
  echo 'TimexDatalinkClient::Protocol7::Eeprom.new(speech: TimexDatalinkClient::Protocol7::Eeprom::Speech.new(device_nickname: [1, 2, 3], user_nickname: [4, 5, 6], phrases: [[7, 8, 9], [10, 11, 12]]))' | nix shell nixpkgs#bundler nixpkgs#ruby nixpkgs#gnumake nixpkgs#gcc --command bundle exec ruby ./golden_test_generator.rb > fixtures/protocol7/speech.jsonl
  echo "Generated output:"
  cat fixtures/protocol7/speech.jsonl
  echo "----------------------------------------"
fi

echo "All Protocol 7 tests generated in fixtures/protocol7/"