# frozen_string_literal: true

require "timex_datalink_client/helpers/length_packet_wrapper"

class TimexDatalinkClient
  class Protocol3
    class Eeprom
      class WristappBlob
        attr_accessor :bytes

        def initialize(bytes:)
          @bytes = bytes
        end

        # Compile a packet for a WristApp Blob
        #
        # @return [Array<Integer>] Array of integers that represent bytes.
        def packet
          bytes
        end

      end
    end
  end
end

