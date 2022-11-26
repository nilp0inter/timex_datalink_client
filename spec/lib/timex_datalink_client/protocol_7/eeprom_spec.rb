# frozen_string_literal: true

require "spec_helper"

describe TimexDatalinkClient::Protocol7::Eeprom do
  let(:activities) { nil }
  let(:phone_numbers) { nil }

  let(:eeprom) do
    described_class.new(
      activities: activities,
      phone_numbers: phone_numbers
    )
  end

  describe "#packets", :crc do
    subject(:packets) { eeprom.packets }

    context "with activities present" do
      let(:activities) do
        [
          TimexDatalinkClient::Protocol7::Eeprom::Activity.new(
            time: Time.new(0, 1, 1, 1, 30, 0),
            messages: [[0xb1]],
            random_speech: false
          ),
          TimexDatalinkClient::Protocol7::Eeprom::Activity.new(
            time: Time.new(0, 1, 1, 2, 30, 0),
            messages: [[0xb1], [0xb2], [0xb3]],
            random_speech: true
          )
        ]
      end

      it_behaves_like "CRC-wrapped packets", [
        [
          0x90, 0x05, 0x02, 0x44, 0x53, 0x49, 0x20, 0x54, 0x6f, 0x79, 0x73, 0x20, 0x70, 0x72, 0x65, 0x73, 0x65, 0x6e,
          0x74, 0x73, 0x2e, 0x2e, 0x2e, 0x65, 0x42, 0x72, 0x61, 0x69, 0x6e, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00
        ],
        [
          0x91, 0x05, 0x01, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0x1e, 0x01, 0x10, 0x00, 0x02, 0x1e, 0x03, 0x15,
          0x00, 0x30, 0xb1, 0xff, 0x00, 0x00, 0x30, 0xb1, 0xfe, 0x00, 0x00, 0x30, 0xb2, 0xfe, 0x00, 0x00, 0x30
        ],
        [0x91, 0x05, 0x02, 0xb3, 0xff, 0x00, 0x00, 0x04],
        [0x92, 0x05]
      ]
    end

    context "with phone numbers present" do
      let(:phone_numbers) do
        [
          TimexDatalinkClient::Protocol7::Eeprom::PhoneNumber.new(
            name: [0xb1, 0xb2, 0xb3],
            number: "1234567890"
          ),
          TimexDatalinkClient::Protocol7::Eeprom::PhoneNumber.new(
            name: [0xb1, 0xb2, 0xb3],
            number: "1234567890"
          )
        ]
      end

      it_behaves_like "CRC-wrapped packets", [
        [
          0x90, 0x05, 0x02, 0x44, 0x53, 0x49, 0x20, 0x54, 0x6f, 0x79, 0x73, 0x20, 0x70, 0x72, 0x65, 0x73, 0x65, 0x6e,
          0x74, 0x73, 0x2e, 0x2e, 0x2e, 0x65, 0x42, 0x72, 0x61, 0x69, 0x6e, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00
        ],
        [
          0x91, 0x05, 0x01, 0x02, 0x00, 0x03, 0xb1, 0xb2, 0xb3, 0xfe, 0x00, 0x02, 0x03, 0x04, 0x05, 0x00, 0x06, 0x07,
          0x08, 0x09, 0x0c, 0x0a, 0x01, 0xfe, 0x00, 0x03, 0xb1, 0xb2, 0xb3, 0xfe, 0x00, 0x02, 0x03, 0x04, 0x05
        ],
        [0x91, 0x05, 0x02, 0x00, 0x06, 0x07, 0x08, 0x09, 0x0c, 0x0a, 0x01, 0xff, 0x00, 0x03],
        [0x92, 0x05]
      ]
    end
  end
end
