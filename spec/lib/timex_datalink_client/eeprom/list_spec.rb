# frozen_string_literal: true

require "spec_helper"

describe TimexDatalinkClient::Eeprom::List do
  let(:list_entry) { "muffler bearings" }
  let(:priority) { 0 }

  let(:list) do
    described_class.new(
      list_entry: list_entry,
      priority: priority
    )
  end

  describe "#packet", :length_packet do
    subject(:packet) { list.packet }

    it_behaves_like "a length-prefixed packet", [
      0x00, 0x96, 0xf7, 0x3c, 0x95, 0xb3, 0x91, 0x8b, 0xa3, 0x6c, 0xd2, 0x05, 0x71, 0x3f
    ]

    context "when priority is 3" do
      let(:priority) { 3 }

      it_behaves_like "a length-prefixed packet", [
        0x03, 0x96, 0xf7, 0x3c, 0x95, 0xb3, 0x91, 0x8b, 0xa3, 0x6c, 0xd2, 0x05, 0x71, 0x3f
      ]
    end

    context "when list_entry is \"headlight fluid with more than 31 characters\"" do
      let(:list_entry) { "headlight fluid with more than 31 characters" }

      it_behaves_like "a length-prefixed packet", [
        0x00, 0x91, 0xa3, 0x34, 0x95, 0x04, 0x45, 0x1d, 0xf9, 0x54, 0x9e, 0xd4, 0x90, 0xa0, 0xd4, 0x45, 0xa4, 0x85,
        0x6d, 0x0e, 0xd9, 0x45, 0xca, 0x45, 0xfe
      ]
    end

    context "when list_entry is \";@_|<>[]" do
      let(:list_entry) { ";@_|<>[]" }

      it_behaves_like "a length-prefixed packet", [
        0x00, 0x36, 0xae, 0xef, 0x7c, 0xef, 0xff, 0x3f
      ]
    end
  end
end
