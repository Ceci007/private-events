class User < ApplicationRecord
  before_save { self.email = email.downcase } 

  validates :name, presence: true
  validates :username, presence: true, length: { in: 4..12 }, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, uniqueness: { case_sensitive: false }, 
            length: { maximum: 105 },
            format: { with: VALID_EMAIL_REGEX }

  has_many :events, dependent: :destroy
  has_many :attendances, dependent: :destroy
  has_many :attended_events, through: :attendances, source: :event

  # host
  has_many :sent_invitations, foreign_key: :host_id, class_name: 'Invitation'
  has_many :invited_users, through: :sent_invitations

  #guest
  has_many :received_invitations, foreign_key: :guest_id, class_name: 'Invitation'
  has_many :invitor_users, through: :received_invitations

  # event received in invitation
  has_many :received_events, foreign_key: :event_id, class_name: 'Invitation'
  has_many :received_invitation_events, through: :received_events

  # event proposed by user
  has_many :sent_events, foreign_key: :event_id, class_name: 'Invitation'
  has_many :sent_invitation_events, through: :sent_events
  
  has_secure_password
end
