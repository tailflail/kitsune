class Profile < ApplicationRecord
  validates :short_biography, length: { maximum: 170, message: "must be at most 170 characters" }
  validates :long_biography, length: { maximum: 5000, message: "must be at most 5000 characters" }

  belongs_to :user

  before_save :sanitize_raw_biographies
  before_save :wrap_links_in_biographies

  private

  # Additional precaution to prevent accidental injection of raw user input
  def sanitize_raw_biographies
    self.short_biography = ActionController::Base.helpers.sanitize(self.short_biography)
    self.long_biography = ActionController::Base.helpers.sanitize(self.long_biography)
  end

  # This code parses URLs provided in the short and long profile biographies.
  # The input is then sanitized to prevent malicious code injection.
  def wrap_links_in_biography(biography)
    biography = biography.gsub(URI.regexp(%w(http https))) do |match|
      uri = URI.parse(match)
      "<a href='#{uri}' target='_blank'>#{uri.host}</a>"
    end
    ActionController::Base.helpers.sanitize(biography)
  end

  def wrap_links_in_biographies
    self.sanitized_short_biography = wrap_links_in_biography(self.short_biography)
    self.sanitized_long_biography = wrap_links_in_biography(self.long_biography)
  end
end
