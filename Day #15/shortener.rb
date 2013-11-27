require 'digest/sha1'

class Shortener 

  #CHAR = ('a'..'z').to_a + ('A'..'Z').to_a + (1..9).to_a
  DOMAIN = 'http://short.com/'

  def initialize url
    @url = url
  end

  def short
    crypt = Digest::SHA1.hexdigest(@url)
    new_url = DOMAIN + crypt[0..5]
  end

end