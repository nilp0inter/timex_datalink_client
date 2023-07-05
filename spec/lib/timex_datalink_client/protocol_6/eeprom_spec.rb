# frozen_string_literal: true

require "spec_helper"

describe TimexDatalinkClient::Protocol6::Eeprom do
  let(:phone_numbers) do
    [
      TimexDatalinkClient::Protocol6::Eeprom::PhoneNumber.new(
        name: "marty mcfly",
        number: "1234567890",
        type: "c",
      ),
      TimexDatalinkClient::Protocol6::Eeprom::PhoneNumber.new(
        name: "doc brown",
        number: "1112223333",
        type: "h",
      )
    ]
  end

  let(:eeprom) { described_class.new(phone_numbers:) }

  describe "#packets", :crc do
    subject(:packets) { eeprom.packets }

    it_behaves_like "CRC-wrapped packets", [
      [0x93, 0x01],
      [0x90, 0x01, 0x02, 0x00, 0x04, 0x02, 0x00],
      [
        0x91, 0x01, 0x01, 0x13, 0x21, 0x43, 0x65, 0x87, 0x09, 0xaf, 0x17, 0x0b, 0x1c, 0x1e, 0x23, 0x0a, 0x17, 0x0d,
        0x10, 0x16, 0x23, 0x5c, 0x11, 0x11, 0x21, 0x22, 0x33, 0x33, 0xcf, 0x0e, 0x19, 0x0d, 0x0a, 0x0c, 0x1c
      ],
      [0x91, 0x01, 0x02, 0x19, 0x21, 0x18, 0x5c],
      [0x92, 0x01]
    ]

    context "with no data" do
      let(:phone_numbers) { [] }

      it_behaves_like "CRC-wrapped packets", [
        [0x93, 0x01],
        [0x90, 0x01, 0x00, 0x00, 0x04, 0x00, 0x00],
        [0x92, 0x01]
      ]
    end
  end
end