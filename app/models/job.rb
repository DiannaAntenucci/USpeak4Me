class Job < ApplicationRecord
  belongs_to :user
  has_many :bookings

  # Search by job_category, address and description
  include PgSearch::Model

  pg_search_scope :search_by_job_category_and_address_and_description,
    against: [:job_category, :address, :description ],
    using: {
      tsearch: { prefix: true }
    }

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
