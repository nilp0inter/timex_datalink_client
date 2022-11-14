# frozen_string_literal: true

require "spec_helper"

describe TimexDatalinkClient::Protocol4::Alarm do
  let(:number) { 1 }
  let(:audible) { false }
  let(:time) { Time.new(1994) }
  let(:message) { "Alarm 1" }

  let(:alarm) do
    described_class.new(
      number: number,
      audible: audible,
      time: time,
      message: message
    )
  end

  describe "#packets", :crc do
    subject(:packets) { alarm.packets }

    it_behaves_like "CRC-wrapped packets", [
      [0x50, 0x01, 0x00, 0x00, 0x00, 0x00, 0x0a, 0x15, 0x0a, 0x1b, 0x16, 0x24, 0x01, 0x24, 0x00]
    ]

    context "when number is 2" do
      let(:number) { 2 }

      it_behaves_like "CRC-wrapped packets", [
        [0x50, 0x02, 0x00, 0x00, 0x00, 0x00, 0x0a, 0x15, 0x0a, 0x1b, 0x16, 0x24, 0x01, 0x24, 0x00]
      ]
    end

    context "when audible is true" do
      let(:audible) { true }

      it_behaves_like "CRC-wrapped packets", [
        [0x50, 0x01, 0x00, 0x00, 0x00, 0x00, 0x0a, 0x15, 0x0a, 0x1b, 0x16, 0x24, 0x01, 0x24, 0x01]
      ]
    end

    context "when time is 16:35" do
      let(:time) { Time.new(1994, 1, 1, 16, 35) }

      it_behaves_like "CRC-wrapped packets", [
        [0x50, 0x01, 0x10, 0x23, 0x00, 0x00, 0x0a, 0x15, 0x0a, 0x1b, 0x16, 0x24, 0x01, 0x24, 0x00]
      ]
    end

    context "when message is \"Wake Up with More than 8 Characters\"" do
      let(:message) { "Wake Up with More than 8 Characters" }

      it_behaves_like "CRC-wrapped packets", [
        [0x50, 0x01, 0x00, 0x00, 0x00, 0x00, 0x20, 0x0a, 0x14, 0x0e, 0x24, 0x1e, 0x19, 0x24, 0x00]
      ]
    end

    context "when message is \";@_|<>[]\"" do
      let(:message) { ";@_|<>[]" }

      it_behaves_like "CRC-wrapped packets", [
        [0x50, 0x01, 0x00, 0x00, 0x00, 0x00, 0x36, 0x38, 0x3a, 0x3b, 0x3c, 0x3d, 0x3e, 0x3f, 0x00]
      ]
    end

    context "when message is \"~with~invalid~characters\"" do
      let(:message) { "~with~invalid~characters" }

      it_behaves_like "CRC-wrapped packets", [
        [0x50, 0x01, 0x00, 0x00, 0x00, 0x00, 0x24, 0x20, 0x12, 0x1d, 0x11, 0x24, 0x12, 0x17, 0x00]
      ]
    end
  end
end
