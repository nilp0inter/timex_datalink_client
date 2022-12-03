# frozen_string_literal: true

require "timex_datalink_client/helpers/four_byte_formatter"

class TimexDatalinkClient
  class Protocol7
    class Eeprom
      class Speech
        include Helpers::FourByteFormatter

        NICKNAME_PACKET_PREFIXES = [
          [
            [0xf0, 0xb0],
            [0xf0, 0xb0],
            [0xf0],
            [0xf0, 0x70, 0x7c],
            [0xd3, 0x33, 0x07],
            [0xf1, 0x9c],
            [0xc1, 0xcc],
            [0xff],
            [0x41, 0xcc],
            [0x37, 0x1f],
            [0x3f],
            [0xf0, 0x83],
            [0x5c],
            [0xb1],
            [0xf0, 0xdc]
          ],
          [
            [0x3c, 0x2c],
            [0x3c, 0x2c],
            [0x3c, 0x30],
            [0x3c, 0x1c, 0x1f],
            [0x34, 0xcc, 0xc1],
            [0x3c, 0x67],
            [0x30, 0x73],
            [0x3f],
            [0x10, 0x73],
            [0x0d, 0xc7],
            [0x0f, 0xf0],
            [0x3c, 0x20],
            [0x17],
            [0x2c, 0x70],
            [0x3c, 0x37, 0x30]
          ],
          [
            [0x0f, 0x0b],
            [0x0f, 0x0b],
            [0x0f, 0x0c],
            [0x0f, 0x07, 0x07],
            [0x0d, 0x33, 0x30, 0x70],
            [0x0f, 0x19],
            [0x0c, 0x1c],
            [0x0f, 0xf0],
            [0x04, 0x1c],
            [0x03, 0x71, 0xf0],
            [0x03, 0xfc],
            [0x0f, 0x08, 0x30],
            [0x05],
            [0x0b, 0x1c],
            [0x0f, 0x0d, 0xcc]
          ],
          [
            [0x03, 0xc2],
            [0x03, 0xc2],
            [0x03, 0xc3],
            [0x03, 0xc1, 0xc1, 0xf0],
            [0x03, 0x4c, 0xcc, 0x1c],
            [0x03, 0xc6, 0x70],
            [0x03, 0x07, 0x30],
            [0x03, 0xfc],
            [0x01, 0x07, 0x30],
            [0x00, 0xdc, 0x7c],
            [0x00, 0xff],
            [0x03, 0xc2, 0x0c],
            [0x01, 0x70],
            [0x02, 0xc7],
            [0x03, 0xc3, 0x73]
          ]
        ]

        NICKNAME_SUFFIXES = [
          [0x53, 0xfd, 0x4d, 0x03, 0x8d],
          [0x53, 0xfd, 0x4d, 0x03, 0x7b],
          [0xfb, 0x63, 0x39, 0x3c],
          [0xfb, 0x61, 0x39, 0x3c, 0x94, 0xfd, 0x4b, 0x03, 0x44, 0x27],
          [0xfb, 0xae, 0x30, 0x29, 0x3c, 0xfb, 0x30, 0x20, 0x3c, 0x39, 0x24],
          [0xfb, 0x53, 0x03, 0xae, 0xe6, 0x8e],
          [0x61, 0x39, 0x3c, 0x44, 0xfd, 0x4b],
          [0xfb, 0x61, 0x3e],
          [0xcb, 0x39, 0x3c, 0x44, 0xfd, 0x4b],
          [0x39, 0x5a, 0xae, 0xfd, 0x4b, 0x8e, 0x81],
          [0x39, 0x5a, 0x1c, 0x81],
          [0x53, 0xfd, 0x4d, 0x03, 0x8d, 0x7b, 0x94],
          [0xe0, 0xab],
          [0x53, 0xfd, 0x4d, 0x82],
          [0x53, 0xfd, 0x4d, 0x03, 0x57, 0x0c, 0xfd, 0x4d]
        ]

        HEADER_VALUE_1_BASE = 0x0b
        HEADER_VALUE_1_DEVICE_NICK = 4

        HEADER_VALUE_2_BASE = 0x00
        HEADER_VALUE_2_PHRASES = 26
        HEADER_VALUE_2_DEVICE_NICK = 8

        HEADER_VALUE_3_BASE = 0x1a
        HEADER_VALUE_3_PHRASES = 2
        HEADER_VALUE_3_DEVICE_NICK = 8

        HEADER_VALUE_4_LENGTH_NO_DEVICE = 10
        HEADER_VALUE_4_LENGTH_WITH_DEVICE = 14

        HEADER_VALUE_4_DEVICE_BASE = 8
        HEADER_VALUE_4_PHRASE = 2

        HEADER_VALUE_4_BASES = [0x1a, 0x1a, 0x1a, 0x1f, 0x1a, 0x1a, 0x1a, 0x1a, 0x1a, 0x1a, 0x79, 0x79, 0x79, 0x79]
        HEADER_VALUE_4_DEVICE_MULTIPLIERS = [5, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 5, 5, 5]

        HEADER_VALUE_4_DEVICE_INDEXES = [
          [0],
          [0],
          [0],
          [0],
          [0],
          [0],
          [0],
          [0],
          [0],
          [0],
          [0],
          [0, 1, 11],
          [0, 1, 11, 12],
          [0, 1, 11, 12, 13]
        ]

        HEADER_VALUE_4_USER_MULTIPLIERS = [0, 0, 5, 5, 5, 5, 5, 5, 5, 5, 10, 5, 5, 0, 0, 0, 0]

        HEADER_VALUE_4_USER_INDEXES = [
          [],
          [],
          [2],
          [2, 5],
          [3, 4, 10],
          [3, 4, 5, 10],
          [3, 4, 5, 6, 10],
          [3, 4, 5, 6, 7, 10],
          [3, 4, 5, 6, 7, 8, 10],
          [3, 4, 5, 6, 7, 8, 9, 10],
          [],
          [],
          [],
          [],
        ]

        HEADER_VALUE_5_BASE = 0x8d
        HEADER_VALUE_5_PHRASE = 2
        HEADER_VALUE_5_PHRASE_INDEX = 5

        PACKETS_TERMINATOR = 0x05

        attr_accessor :phrases, :device_nickname, :user_nickname

        # Create a Speech instance.
        #
        # @param phrases [Array<Array<Integer>>] Two-dimensional array of phrases.
        # @param device_nickname [Array<Integer>] Device nickname.
        # @param user_nickname [Array<Integer>] User nickname.
        # @return [Speech] Speech instance.
        def initialize(phrases: [], device_nickname: [], user_nickname: [])
          @phrases = phrases
          @device_nickname = device_nickname
          @user_nickname = user_nickname
        end

        # Compile data for nicknames and phrases..
        #
        # @return [Array] Compiled data of all nicknames and phrases.
        def packets
          header + nickname_bytes + formatted_phrases + [PACKETS_TERMINATOR]
        end

        private

        def header
          value_1 = HEADER_VALUE_1_BASE + phrases.count
          value_1 += HEADER_VALUE_1_DEVICE_NICK if device_nickname.any?

          value_2 = HEADER_VALUE_2_BASE
          value_2 += HEADER_VALUE_2_PHRASES if phrases.any?
          value_2 += HEADER_VALUE_2_DEVICE_NICK if phrases.any? && device_nickname.any?

          value_3 = HEADER_VALUE_3_BASE
          value_3 += HEADER_VALUE_3_DEVICE_NICK if device_nickname.any?
          value_3 += HEADER_VALUE_3_PHRASES * phrases.count

          packet_counts = nicknames_with_suffixes.map { |nickname| 1 + nickname.count / 4 }
          value_4_length = device_nickname.any? ? HEADER_VALUE_4_LENGTH_WITH_DEVICE : HEADER_VALUE_4_LENGTH_NO_DEVICE

          value_4 = value_4_length.times.flat_map do |value_4_index|
            device_value = HEADER_VALUE_4_DEVICE_INDEXES[value_4_index].sum { |device_index| packet_counts[device_index] }
            device_value *= HEADER_VALUE_4_DEVICE_MULTIPLIERS[value_4_index]

            user_value = HEADER_VALUE_4_USER_INDEXES[value_4_index].sum { |device_index| packet_counts[device_index] }
            user_value *= HEADER_VALUE_4_USER_MULTIPLIERS[value_4_index]

            value = device_value + user_value
            value += HEADER_VALUE_4_BASES[value_4_index]
            value += HEADER_VALUE_4_PHRASE * phrases.count
            value += HEADER_VALUE_4_DEVICE_BASE if device_nickname.any?

            value.divmod(256).reverse
          end

          value_5 = phrases.each_index.flat_map do |phrase_index|
            value = HEADER_VALUE_5_BASE
            value += HEADER_VALUE_5_PHRASE * phrases.count
            value += HEADER_VALUE_5_PHRASE_INDEX * phrase_index

            value.divmod(256).reverse
          end

          [value_1, 0, value_2, 0, value_3, 0] + value_4 + value_5
        end

        def nickname_bytes
          four_byte_format_for(nicknames_with_suffixes, packet_prefixes: packet_prefixes)
        end

        def nickname_format
          [
            device_nickname,
            device_nickname,
            user_nickname,
            user_nickname,
            user_nickname,
            user_nickname,
            user_nickname,
            user_nickname,
            user_nickname,
            user_nickname,
            user_nickname,
            device_nickname,
            device_nickname,
            device_nickname,
            device_nickname
          ]
        end

        def nicknames_with_suffixes
          nickname_format.each_with_index.map do |nickname, nickname_index|
            nickname + NICKNAME_SUFFIXES[nickname_index]
          end
        end

        def packet_prefixes
          nickname_format.each_with_index.flat_map do |nickname, nickname_index|
            prefix_index = nickname.length % 4
            prefix_map = NICKNAME_PACKET_PREFIXES[prefix_index][nickname_index]
            prefix_pad = [0x00] * (nickname.length / 4)

            prefix_pad + prefix_map
          end
        end

        def formatted_phrases
          return [] if phrases.empty?

          four_byte_format_for(phrases)
        end
      end
    end
  end
end
