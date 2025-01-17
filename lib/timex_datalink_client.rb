# frozen_string_literal: true

require "timex_datalink_client/notebook_adapter"
require "timex_datalink_client/version"

require "timex_datalink_client/protocol_1/alarm"
require "timex_datalink_client/protocol_1/eeprom"
require "timex_datalink_client/protocol_1/eeprom/anniversary"
require "timex_datalink_client/protocol_1/eeprom/appointment"
require "timex_datalink_client/protocol_1/eeprom/list"
require "timex_datalink_client/protocol_1/eeprom/phone_number"
require "timex_datalink_client/protocol_1/end"
require "timex_datalink_client/protocol_1/start"
require "timex_datalink_client/protocol_1/sync"
require "timex_datalink_client/protocol_1/time"
require "timex_datalink_client/protocol_1/time_name"

require "timex_datalink_client/protocol_3/alarm"
require "timex_datalink_client/protocol_3/eeprom"
require "timex_datalink_client/protocol_3/eeprom/anniversary"
require "timex_datalink_client/protocol_3/eeprom/appointment"
require "timex_datalink_client/protocol_3/eeprom/list"
require "timex_datalink_client/protocol_3/eeprom/phone_number"
require "timex_datalink_client/protocol_3/eeprom/wristapp_blob"
require "timex_datalink_client/protocol_3/end"
require "timex_datalink_client/protocol_3/sound_options"
require "timex_datalink_client/protocol_3/sound_theme"
require "timex_datalink_client/protocol_3/start"
require "timex_datalink_client/protocol_3/sync"
require "timex_datalink_client/protocol_3/time"
require "timex_datalink_client/protocol_3/wrist_app"

require "timex_datalink_client/protocol_4/alarm"
require "timex_datalink_client/protocol_4/eeprom"
require "timex_datalink_client/protocol_4/eeprom/anniversary"
require "timex_datalink_client/protocol_4/eeprom/appointment"
require "timex_datalink_client/protocol_4/eeprom/list"
require "timex_datalink_client/protocol_4/eeprom/phone_number"
require "timex_datalink_client/protocol_4/end"
require "timex_datalink_client/protocol_4/sound_options"
require "timex_datalink_client/protocol_4/sound_theme"
require "timex_datalink_client/protocol_4/start"
require "timex_datalink_client/protocol_4/sync"
require "timex_datalink_client/protocol_4/time"
require "timex_datalink_client/protocol_4/wrist_app"

require "timex_datalink_client/protocol_6/alarm"
require "timex_datalink_client/protocol_6/eeprom"
require "timex_datalink_client/protocol_6/eeprom/phone_number"
require "timex_datalink_client/protocol_6/end"
require "timex_datalink_client/protocol_6/night_mode_options"
require "timex_datalink_client/protocol_6/pager_options"
require "timex_datalink_client/protocol_6/sound_scroll_options"
require "timex_datalink_client/protocol_6/start"
require "timex_datalink_client/protocol_6/sync"
require "timex_datalink_client/protocol_6/time"

require "timex_datalink_client/protocol_7/eeprom"
require "timex_datalink_client/protocol_7/eeprom/activity"
require "timex_datalink_client/protocol_7/eeprom/calendar"
require "timex_datalink_client/protocol_7/eeprom/calendar/event"
require "timex_datalink_client/protocol_7/eeprom/games"
require "timex_datalink_client/protocol_7/eeprom/phone_number"
require "timex_datalink_client/protocol_7/eeprom/speech"
require "timex_datalink_client/protocol_7/end"
require "timex_datalink_client/protocol_7/phrase_builder"
require "timex_datalink_client/protocol_7/start"
require "timex_datalink_client/protocol_7/sync"

require "timex_datalink_client/protocol_9/alarm"
require "timex_datalink_client/protocol_9/eeprom"
require "timex_datalink_client/protocol_9/eeprom/chrono"
require "timex_datalink_client/protocol_9/eeprom/phone_number"
require "timex_datalink_client/protocol_9/end"
require "timex_datalink_client/protocol_9/sound_options"
require "timex_datalink_client/protocol_9/start"
require "timex_datalink_client/protocol_9/sync"
require "timex_datalink_client/protocol_9/time"
require "timex_datalink_client/protocol_9/time_name"
require "timex_datalink_client/protocol_9/timer"

class TimexDatalinkClient
  attr_accessor :serial_device, :models, :byte_sleep, :packet_sleep, :verbose

  # Create a TimexDatalinkClient instance.
  #
  # @param serial_device [String, nil] Path to serial device.
  # @param models [Array<Protocol1::Sync, Protocol1::Start, Protocol1::Time, Protocol1::TimeName, Protocol1::Alarm,
  #   Protocol1::Eeprom, Protocol1::End, Protocol3::Sync, Protocol3::Start, Protocol3::Time, Protocol3::Alarm,
  #   Protocol3::SoundTheme, Protocol3::SoundOptions, Protocol3::WristApp, Protocol3::Eeprom, Protocol3::End,
  #   Protocol4::Sync, Protocol4::Start, Protocol4::Time, Protocol4::Alarm, Protocol4::SoundTheme,
  #   Protocol4::SoundOptions, Protocol4::WristApp, Protocol4::Eeprom, Protocol4::End, Protocol6::Sync,
  #   Protocol6::Start, Protocol6::Time, Protocol6::Alarm, Protocol6::PagerOptions, Protocol6::NightModeOptions,
  #   Protocol6::SoundScrollOptions, Protocol6::Eeprom, Protocol6::End, Protocol7::Sync, Protocol7::Start,
  #   Protocol7::Eeprom, Protocol7::End, Protocol9::Sync, Protocol9::Start, Protocol9::Time, Protocol9::TimeName,
  #   Protocol9::Alarm, Protocol9::Timer, Protocol9::SoundOptions, Protocol9::Eeprom, Protocol9::End>] Models to compile
  #   data for.
  # @param byte_sleep [Integer, nil] Time to sleep after sending byte.
  # @param packet_sleep [Integer, nil] Time to sleep after sending packet of bytes.
  # @param verbose [Boolean] Write verbose output to console.
  # @return [TimexDatalinkClient] TimexDatalinkClient instance.
  def initialize(serial_device: nil, models: [], byte_sleep: nil, packet_sleep: nil, verbose: false)
    @serial_device = serial_device
    @models = models
    @byte_sleep = byte_sleep
    @packet_sleep = packet_sleep
    @verbose = verbose
  end

  # Write data for all models to serial device.
  #
  # @return [void]
  def write
    notebook_adapter.write(packets)
  end

  # Compile packets for all models.
  #
  # @return [Array<Array<Integer>>] Two-dimensional array of integers that represent bytes.
  def packets
    models.flat_map(&:packets)
  end

  private

  def notebook_adapter
    @notebook_adapter ||= NotebookAdapter.new(
      serial_device:,
      byte_sleep:,
      packet_sleep:,
      verbose:
    )
  end
end
