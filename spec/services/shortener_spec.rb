require 'rails_helper'

RSpec.describe Shortener do

  it 'give URL 2 chars' do
    url = "https://google.com"
    shortener = Shortener.new(url)
    expect(shortener.lookup_code.to_s.length).to eq(2)
  end

  it 'give each URL 2 char' do
    url = "https://google.com"
    shortener = Shortener.new(url)
    code_a1 = shortener.lookup_code

    url = "https://online.sochisirius.ru/"
    shortener = Shortener.new(url)
    code_a2 = shortener.lookup_code

    expect(code_a2).not_to eq(code_a1)
  end

  it "generate a Link record with a unique lookup code" do
    url = "https://google.com"
    shortener = Shortener.new(url)
    link = shortener.generate_short_link
    expect(link.valid?).to be(true)
    # expect(link.og_url).to eq(url)

    link2 = shortener.generate_short_link
    expect(link2.valid?).to be(true)
  end
end
