# frozen_string_literal: true

require "spec_helper"

describe TimexDatalinkClient::Protocol7::Eeprom::Games do
  let(:memory_game_enabled) { false }
  let(:fortune_teller_enabled) { false }
  let(:countdown_timer_enabled) { false }
  let(:countdown_timer_seconds) { 60 }
  let(:countdown_timer_sound) { 0x062 }
  let(:mind_reader_enabled) { false }
  let(:music_time_keeper_enabled) { false }
  let(:music_time_keeper_sound) { 0x062 }
  let(:morse_code_practice_enabled) { false }
  let(:treasure_hunter_enabled) { false }
  let(:rhythm_rhyme_buster_enabled) { false }
  let(:stop_watch_enabled) { false }
  let(:red_light_green_light_enabled) { false }

  let(:sounds) do
    described_class.new(
      memory_game_enabled: memory_game_enabled,
      fortune_teller_enabled: fortune_teller_enabled,
      countdown_timer_enabled: countdown_timer_enabled,
      countdown_timer_seconds: countdown_timer_seconds,
      countdown_timer_sound: countdown_timer_sound,
      mind_reader_enabled: mind_reader_enabled,
      music_time_keeper_enabled: music_time_keeper_enabled,
      music_time_keeper_sound: music_time_keeper_sound,
      morse_code_practice_enabled: morse_code_practice_enabled,
      treasure_hunter_enabled: treasure_hunter_enabled,
      rhythm_rhyme_buster_enabled: rhythm_rhyme_buster_enabled,
      stop_watch_enabled: stop_watch_enabled,
      red_light_green_light_enabled: red_light_green_light_enabled
    )
  end

  describe "#packet" do
    subject(:packet) { sounds.packet }

    it { should eq([0x00, 0x00, 0x58, 0x02, 0x30, 0x62, 0xfe, 0x00, 0x00, 0x30, 0x62, 0xfe, 0x00, 0x00, 0x02]) }

    context "when memory_game_enabled is true" do
      let(:memory_game_enabled) { true }

      it { should eq([0x01, 0x00, 0x58, 0x02, 0x30, 0x62, 0xfe, 0x00, 0x00, 0x30, 0x62, 0xfe, 0x00, 0x00, 0x02]) }
    end

    context "when fortune_teller_enabled is true" do
      let(:fortune_teller_enabled) { true }

      it { should eq([0x02, 0x00, 0x58, 0x02, 0x30, 0x62, 0xfe, 0x00, 0x00, 0x30, 0x62, 0xfe, 0x00, 0x00, 0x02]) }
    end

    context "when countdown_timer_enabled is true" do
      let(:countdown_timer_enabled) { true }

      it { should eq([0x04, 0x00, 0x58, 0x02, 0x30, 0x62, 0xfe, 0x00, 0x00, 0x30, 0x62, 0xfe, 0x00, 0x00, 0x02]) }
    end

    context "when countdown_timer_seconds is 20" do
      let(:countdown_timer_seconds) { 20 }

      it { should eq([0x00, 0x00, 0xc8, 0x00, 0x30, 0x62, 0xfe, 0x00, 0x00, 0x30, 0x62, 0xfe, 0x00, 0x00, 0x02]) }
    end

    context "when countdown_timer_sound is 0x069" do
      let(:countdown_timer_sound) { 0x069 }

      it { should eq([0x00, 0x00, 0x58, 0x02, 0x30, 0x62, 0xfe, 0x00, 0x00, 0x30, 0x69, 0xfe, 0x00, 0x00, 0x02]) }
    end

    context "when mind_reader_enabled is true" do
      let(:mind_reader_enabled) { true }

      it { should eq([0x08, 0x00, 0x58, 0x02, 0x30, 0x62, 0xfe, 0x00, 0x00, 0x30, 0x62, 0xfe, 0x00, 0x00, 0x02]) }
    end

    context "when music_time_keeper_enabled is true" do
      let(:music_time_keeper_enabled) { true }

      it { should eq([0x10, 0x00, 0x58, 0x02, 0x30, 0x62, 0xfe, 0x00, 0x00, 0x30, 0x62, 0xfe, 0x00, 0x00, 0x02]) }
    end

    context "when music_time_keeper_sound is 0x064" do
      let(:music_time_keeper_sound) { 0x064 }

      it { should eq([0x00, 0x00, 0x58, 0x02, 0x30, 0x64, 0xfe, 0x00, 0x00, 0x30, 0x62, 0xfe, 0x00, 0x00, 0x02]) }
    end

    context "when morse_code_practice_enabled is true" do
      let(:morse_code_practice_enabled) { true }

      it { should eq([0x20, 0x00, 0x58, 0x02, 0x30, 0x62, 0xfe, 0x00, 0x00, 0x30, 0x62, 0xfe, 0x00, 0x00, 0x02]) }
    end

    context "when treasure_hunter_enabled is true" do
      let(:treasure_hunter_enabled) { true }

      it { should eq([0x40, 0x00, 0x58, 0x02, 0x30, 0x62, 0xfe, 0x00, 0x00, 0x30, 0x62, 0xfe, 0x00, 0x00, 0x02]) }
    end

    context "when rhythm_rhyme_buster_enabled is true" do
      let(:rhythm_rhyme_buster_enabled) { true }

      it { should eq([0x80, 0x00, 0x58, 0x02, 0x30, 0x62, 0xfe, 0x00, 0x00, 0x30, 0x62, 0xfe, 0x00, 0x00, 0x02]) }
    end

    context "when stop_watch_enabled is true" do
      let(:stop_watch_enabled) { true }

      it { should eq([0x00, 0x01, 0x58, 0x02, 0x30, 0x62, 0xfe, 0x00, 0x00, 0x30, 0x62, 0xfe, 0x00, 0x00, 0x02]) }
    end

    context "when red_light_green_light_enabled is true" do
      let(:red_light_green_light_enabled) { true }

      it { should eq([0x00, 0x02, 0x58, 0x02, 0x30, 0x62, 0xfe, 0x00, 0x00, 0x30, 0x62, 0xfe, 0x00, 0x00, 0x02]) }
    end
  end
end
