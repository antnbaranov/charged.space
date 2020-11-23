require 'rails_helper'

RSpec.describe Shortener do

  it 'give URL 8 char' do
    url = "https://www.google.com"
    shortener = Shortener.new(url)
    expect(shortener.lookup_code.length).to eq(8)
  end

  it 'give each URL 8 char' do
    url = "https://www.google.com"
    shortener = Shortener.new(url)
    code_A1 = shortener.lookup_code

    url = "https://www.google.com"
    shortener = Shortener.new(url)
    code_A1 = shortener.lookup_codeurl = "https://online.sochisirius.ru/"
    shortener = Shortener.new(url)
    code_A2 = shortener.lookup_code

    expect(code_A2).not_to eq(code_A1)
  end

  it "give same URl..."
  url = "https://www.google.com"
  shortener = Shortener.new(url)
  code_B1 = shortener.lookup_code

  url = "https://www.google.com"
  shortener = Shortener.new(url)
  code_B2 = shortener.lookup_code

  expect(code_B1).not_to eq(code_B2)

end
