class Day < ApplicationRecord
  belongs_to :plan
  has_many :schedules, dependent: :destroy
end
