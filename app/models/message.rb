class Message < ApplicationRecord
  belongs_to :user
  belongs_to :channel

  validates :content, presence: true

  after_create :broadcast_message

  private

  def broadcast_message
    ActionCable.server.broadcast("channel_#{channel_.name}", self)
  end
end
