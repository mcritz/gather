class Event < ApplicationRecord
  belongs_to :group

  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :location, presence: true
  validates :group, presence: true
  validates :venue_foursquare_id, presence: true

  scope :future_or_now, -> { where('end_at >= ?', Time.current).order(:created_at) }
  scope :past, -> { where('end_at < ?', Time.current).order(created_at: :desc) }

  def self.next
    future_or_now.first
  end

  def venue
    @venue ||= Venue.find(venue_foursquare_id)
  end
end
