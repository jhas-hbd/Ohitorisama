class Schedule < ApplicationRecord
  belongs_to :day

  enum transportation:{
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

end
