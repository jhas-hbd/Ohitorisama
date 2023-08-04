class Schedule < ApplicationRecord
  belongs_to :day

  enum transportation:{
    "移動手段":0,
    車:1,バス:1,電車:2,徒歩:3,自転車:4,その他:5
  }
end
