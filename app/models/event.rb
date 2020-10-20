class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: :user_id
  has_many :attendances
  has_many :attendees, through: :attendances, source: :user

  has_many :invitations
  has_many :invited_users, through: :invitations, source: :guest

  scope :upcoming_events, -> { where('date >= ?', Date.today) }
  scope :past_events, -> { where('date < ?', Date.today) }
end
