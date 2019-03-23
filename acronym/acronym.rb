module Acronym
  def self.abbreviate(text="PNG")
    text.scan(/\b[[:alpha:]]/).join.upcase
  end
end