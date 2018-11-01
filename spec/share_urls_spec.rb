# frozen_string_literal: true

require "faraday"

RSpec.describe ShareUrls do
  before(:all) { ShareUrls.reset_config }

  it "has a version number" do
    expect(ShareUrls::VERSION).to eq("1.0.3")
  end

  describe ".config" do
    subject { described_class.config }
    {
      adapter: {
        default: Faraday.default_adapter,
        valid_value: :httpclient
      },
      api_key: {
        default: nil,
        valid_value: "foobar"
      },
      dynamic_link_domain: {
        default: nil,
        valid_value: "http://abc.com/abc"
      },
      timeout: {
        default: 3,
        valid_value: 2
      },
      open_timeout: {
        default: 3,
        valid_value: 1
      },
      suffix_option: {
        default: "UNGUESSABLE",
        valid_value: "SHORT"
      }
    }.each do |method, meta|
      describe ".#{method}" do
        it "default value is #{meta[:default].nil? ? 'nil' : meta[:default]}" do
          expect(subject.send(method.to_sym)).to eq(meta[:default])
        end

        it "is writable" do
          subject.send("#{method}=".to_sym, meta[:valid_value])
          expect(subject.send(method.to_sym)).to eq(meta[:valid_value])
        end
      end
    end

    describe "suffix_option=" do
      it "raises ShareUrls::InvalidConfig if given parameter is not valid" do
        expect { subject.suffix_option = "FOO" }.to raise_error(ShareUrls::InvalidConfig)
      end
    end
  end
end
