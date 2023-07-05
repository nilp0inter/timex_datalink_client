# frozen_string_literal: true

require "spec_helper"

describe TimexDatalinkClient::Protocol6::Eeprom::PhoneNumber do
  let(:name) { "Marty McFly" }
  let(:number) { "1234567890" }
  let(:type) { "c" }

  let(:phone_number) do
    described_class.new(
      name:,
      number:,
      type:
    )
  end

  describe "#packet", :length_packet do
    subject(:packet) { phone_number.packet }

    it_behaves_like "a length-prefixed packet", [
      0x21, 0x43, 0x65, 0x87, 0x09, 0xaf, 0x17, 0x0b, 0x1c, 0x1e, 0x23, 0x0a, 0x17, 0x0d, 0x10, 0x16, 0x23, 0x5c
    ]

    context "when name is \"Doc Brown with More than 31 Characters\"" do
      let(:name) { "Doc Brown with More than 31 Characters" }

      it_behaves_like "a length-prefixed packet", [
        0x21, 0x43, 0x65, 0x87, 0x09, 0xaf, 0x0e, 0x19, 0x0d, 0x0a, 0x0c, 0x1c, 0x19, 0x21, 0x18, 0x0a, 0x21, 0x13,
        0x1e, 0x12, 0x0a, 0x17, 0x19, 0x1c, 0x0f, 0x0a, 0x1e, 0x12, 0x0b, 0x18, 0x0a, 0x03, 0x01, 0x0a, 0x0d, 0x12,
        0x0b, 0x5c
      ]
    end

    context "when name is \";@_|<>[]\"" do
      let(:name) { ";@_|<>[]" }

      it_behaves_like "a length-prefixed packet", [
        0x21, 0x43, 0x65, 0x87, 0x09, 0xaf, 0x35, 0x3a, 0x3f, 0x42, 0x36, 0x38, 0x3b, 0x3d, 0x5c
      ]
    end

    context "when name is \"~with~invalid~characters\"" do
      let(:name) { "~with~invalid~characters" }

      it_behaves_like "a length-prefixed packet", [
        0x21, 0x43, 0x65, 0x87, 0x09, 0xaf, 0x44, 0x21, 0x13, 0x1e, 0x12, 0x44, 0x13, 0x18, 0x20, 0x0b, 0x16, 0x13,
        0x0e, 0x44, 0x0d, 0x12, 0x0b, 0x1c, 0x0b, 0x0d, 0x1e, 0x0f, 0x1c, 0x1d, 0x5c
      ]
    end

    context "when number is \"123\"" do
      let(:number) { "123" }

      it_behaves_like "a length-prefixed packet", [
        0xff, 0xff, 0xff, 0x1f, 0x32, 0xaf, 0x17, 0x0b, 0x1c, 0x1e, 0x23, 0x0a, 0x17, 0x0d, 0x10, 0x16, 0x23, 0x5c
      ]
    end

    context "when number is \"123456789012345678901234567890\"" do
      let(:number) { "123456789012345678901234567890" }

      it_behaves_like "a length-prefixed packet", [
        0x21, 0x43, 0x65, 0x87, 0x09, 0x21, 0x17, 0x0b, 0x1c, 0x1e, 0x23, 0x0a, 0x17, 0x0d, 0x10, 0x16, 0x23, 0x31,
        0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x00, 0x5c
      ]

      context "when name is \"Doc Brown with More than 11 Characters\"" do
        let(:name) { "Doc Brown with More than 11 Characters" }

        it_behaves_like "a length-prefixed packet", [
          0x21, 0x43, 0x65, 0x87, 0x09, 0x21, 0x0e, 0x19, 0x0d, 0x0a, 0x0c, 0x1c, 0x19, 0x21, 0x18, 0x0a, 0x21, 0x31,
          0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x00,
          0x5c
        ]
      end
    end

    context "when number is \"1~2~3\"" do
      let(:number) { "1~2~3" }

      it_behaves_like "a length-prefixed packet", [
        0xff, 0xff, 0x1f, 0x2f, 0x3f, 0xaf, 0x17, 0x0b, 0x1c, 0x1e, 0x23, 0x0a, 0x17, 0x0d, 0x10, 0x16, 0x23, 0x5c
      ]
    end

    context "when type is \"w2\"" do
      let(:type) { "w2" }

      it_behaves_like "a length-prefixed packet", [
        0x21, 0x43, 0x65, 0x87, 0x09, 0xef, 0x17, 0x0b, 0x1c, 0x1e, 0x23, 0x0a, 0x17, 0x0d, 0x10, 0x16, 0x23, 0x5c
      ]
    end

    context "when type is \"H\"" do
      let(:type) { "H" }

      it_behaves_like "a length-prefixed packet", [
        0x21, 0x43, 0x65, 0x87, 0x09, 0xcf, 0x17, 0x0b, 0x1c, 0x1e, 0x23, 0x0a, 0x17, 0x0d, 0x10, 0x16, 0x23, 0x5c
      ]
    end

    context "when type is \"~\"" do
      let(:type) { "~" }

      it_behaves_like "a length-prefixed packet", [
        0x21, 0x43, 0x65, 0x87, 0x09, 0xff, 0x17, 0x0b, 0x1c, 0x1e, 0x23, 0x0a, 0x17, 0x0d, 0x10, 0x16, 0x23, 0x5c
      ]
    end
  end
end
