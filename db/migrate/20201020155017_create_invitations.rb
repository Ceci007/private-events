class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      # validates :host_id, uniqueness: { scope: :guest_id, :event_id }
      # validates :guest_id, uniqueness: { scope: :host_id, :event_id }
      #validates :event_id, uniqueness: { scope: :guest_id, :host_id }
      t.references :host, null: false, foreign_key: true
      t.references :guest, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.timestamps
    end
  end
end
