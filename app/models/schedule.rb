class Schedule < ApplicationRecord
  belongs_to :day

  enum transportation: {
    車:0,バス:1,電車:2,徒歩:3,自転車:4,その他:5
  }

  validates :start_at, presence: true
  validates :finished_at, presence: true
  validates :place, presence: true
  validates :schedule_comment, length: { maximum: 200 }
  validates :cost, presence: true
  validates :transportation, presence: true
  validates :transfer_time, presence: true
  validates :expense, presence: true

  before_validation :insert_day_to_times

  def insert_day_to_times
    day = self.day
    day_to_datetime = day.day.to_time.in_time_zone.beginning_of_day
    start_at_hours = self.start_at.hour
    start_at_minutes = self.start_at.min
    self.start_at = day_to_datetime.since(start_at_hours.hours).since(start_at_minutes.minutes)
    finished_at_hours = self.finished_at.hour
    finished_at_minutes = self.finished_at.min
    self.finished_at = day_to_datetime.since(finished_at_hours.hours).since(finished_at_minutes.minutes)
  end
end
