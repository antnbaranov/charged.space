require 'rails_helper'

RSpec.describe Link, type: :model do

  it "valid og url + lookup code" do
    link = Link.new(
    og_url: "https://online.sochisirius.ru/", lookup_code: "12345678")
    expect(link.valid?).to be(true)
  end

  it "is invalid if url is not formatted properly" do
    link = Link.new(
        og_url: "hgfdrftyuio", lookup_code: "12345678")
    expect(link.valid?).to be(false)
  end

  it "is invalid if does not gave a lookup code" do
    link = Link.new(
        og_url: "https://online.sochisirius.ru/")
    expect(link.valid?).to be(false)
  end

  it "invalid does not have a OG url" do
    link = Link.new( lookup_code: "12345678")
    expect(link.valid?).to be(false)
  end

  it "is invalid lookup code already exist" do
    link = Link.new( og_url: "https://online.sochisirius.ru/",
                     lookup_code: "12345678")
  end


  it "each url lookup code" do
    url = "https://online.sochisirius.ru/"
    shortener = Shortener.new(url)
    code_A1 = shortener.lookup_code

    url = "https://google.com"
    shortener = Shortener.new(url)
    code_A2 = shortener.lookup_code

    expect(code_A2).not_to eq(code_A1)
  end

  it "generate unique Link" do
    url = "https://online.sochisirius.ru/"
    shortener = Shortener.new(url)
    link = shortener.generate_short_link
    expect(link.valid?).to be true
    expect(link.og_url).to eq(url)
  end

end