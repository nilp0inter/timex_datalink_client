# frozen_string_literal: true

require "spec_helper"

describe TimexDatalinkClient::Eeprom::PhoneNumber do
  let(:name) { "marty mcfly" }
  let(:number) { "1234567890" }
  let(:type) { "c" }

  let(:phone_number) do
    described_class.new(
      name: name,
      number: number,
      type: type,
    )
  end

  describe "#packet", :length_packet do
    subject(:packet) { phone_number.packet }

    it_behaves_like "a length-prefixed packet", [
      0x21, 0x43, 0x65, 0x87, 0x09, 0xaf, 0x96, 0xb2, 0x75, 0x22, 0x69, 0x31, 0x4f, 0x25, 0xfe
    ]

    context "when name is \"doc brown with more than 31 characters\"" do
      let(:name) { "doc brown with more than 31 characters" }

      it_behaves_like "a length-prefixed packet", [
        0x21, 0x43, 0x65, 0x87, 0x09, 0xaf, 0x0d, 0xc6, 0x90, 0xcb, 0x86, 0x81, 0x17, 0x09, 0x4a, 0x5d, 0x44, 0x5a,
        0xd8, 0xe6, 0x90, 0x5d, 0xa4, 0x5c, 0xe4, 0x10, 0x90, 0x4c, 0xa4, 0xfc
      ]
    end

    context "when name is \";@_|<>[]" do
      let(:name) { ";@_|<>[]" }

      it_behaves_like "a length-prefixed packet", [
        0x21, 0x43, 0x65, 0x87, 0x09, 0xaf, 0x36, 0xae, 0xef, 0x7c, 0xef, 0xff, 0x3f
      ]
    end

    context "when number is 123" do
      let(:number) { "123" }

      it_behaves_like "a length-prefixed packet", [
        0xff, 0xff, 0xff, 0x1f, 0x32, 0xaf, 0x96, 0xb2, 0x75, 0x22, 0x69, 0x31, 0x4f, 0x25, 0xfe
      ]
    end

    context "when number is 12345678901234567890" do
      let(:number) { "12345678901234567890" }

      it_behaves_like "a length-prefixed packet", [
        0x21, 0x43, 0x65, 0x87, 0x09, 0x21, 0x96, 0xb2, 0x75, 0x22, 0x69, 0x31, 0x4f, 0x25, 0xfe
      ]
    end

    context "when type is \"h\"" do
      let(:type) { "h" }

      it_behaves_like "a length-prefixed packet", [
        0x21, 0x43, 0x65, 0x87, 0x09, 0xcf, 0x96, 0xb2, 0x75, 0x22, 0x69, 0x31, 0x4f, 0x25, 0xfe
      ]
    end
  end
end
