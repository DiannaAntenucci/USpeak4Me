class Job < ApplicationRecord
  belongs_to :user
  has_many :bookings

  # Job Urgency Level
  URGENCY_LEVELS = {
    1 => '😌 Not Urgent',
    2 => '👀 Low',
    3 => '⏰ Medium',
    4 => '😱 High',
    5 => '🔥 Urgent'
  }.freeze

  # Method to get the text description of urgency
  def urgency_description
    URGENCY_LEVELS[self.urgency] || 'Unknown'
  end
end
