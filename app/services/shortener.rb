require 'digest/sha2'

class Shortener

  def initialize(url)
    @url = url
  end

  def lookup_code
    Digest::SHA256.hexdigest(url)[0..7]
  end
end

