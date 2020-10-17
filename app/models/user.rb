class User < ApplicationRecord
  before_save { self.email = email.downcase if email } 

  validates :name, presence: true
  validates :username, presence: true, length: { in: 4..12 }, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, uniqueness: { case_sensitive: false }, 
            length: { maximum: 105 },
            format: { with: VALID_EMAIL_REGEX }

  has_many :events
  has_many :attendances
  has_many :attended_events, through: :attendances, source: :event

  def avatar
    email_address = self.email.downcase
    hash = Digest::MD5.hexdigest(email_address)
    size = options[:size]
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}"
  end
end
