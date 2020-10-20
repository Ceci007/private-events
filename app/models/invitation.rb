class Invitation < ApplicationRecord
  belongs_to :host, class_name: "User", foreign_key: :user_id
  belongs_to :guest, class_name: "User", foreign_key: :user_id
  belongs_to :event

  validates :host_id, uniqueness: { scope: :guest_id, :event_id }
  validates :guest_id, uniqueness: { scope: :host_id, :event_id }
  validates :event_id, uniqueness: { scope: :guest_id, :host_id }
end
