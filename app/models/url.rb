class Url < ApplicationRecord
  validates :long_url, presence: true, uniqueness: true, format: {with: /https?:\/\/[\S]+/, message: "please enter a valid url address."}
  before_create :shorten
  def shorten
    code = SecureRandom.hex(4)
    self.short_url = code
  end
end
