class User < ApplicationRecord
  has_many :events, foreign_key: :creator_id
  has_many :event_attendances, foreign_key: :attendee_id
  has_many :attended_events, through: :event_attendances, source: :attended_event

  def previous_events
    attended_events.past
  end

  def upcoming_events
    attended_events.upcoming
  end
end
