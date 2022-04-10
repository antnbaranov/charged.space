class Link < ApplicationRecord
  validates_presence_of :lookup_code, :og_url
  validates_uniqueness_of :lookup_code
  validate :og_url_format

  def og_url_format
    uri = URI.parse(og_url || "")
    if uri.host.nil?
      errors.add(:og_url, "Invalid URL format")
    end
  end

  def shortened_url
    "http://charged.space/#{lookup_code}"
  end
end


