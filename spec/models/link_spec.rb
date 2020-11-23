require 'rails_helper'

RSpec.describe Link do

  it "VALID always OG URL/ lookoup code" do
    link = Link.new(og_url: "https://google.com" , lookup_code: 'youHarsh' )
    expect(link.valid?).to be(true)
  end

  it "INVALIDal lokup code" do
    link = Link.new( lookup_code: "youHarsh")
    expect(link.valid?).to be(false)
  end

  it "already exist" do
    link_C1 = Link.new(og_url: "https://www.google.com" , lookup_code: 'youHarsh' )
    link.save

    link_C2 = Link.new(og_url: "https://online.sochisirius.ru/", lookup_code: youHarsh)
    expect(linl_C2.valid?).to be(false)
  end
end