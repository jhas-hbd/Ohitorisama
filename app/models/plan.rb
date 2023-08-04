class Plan < ApplicationRecord
  belongs_to :user
  has_many :days, dependent: :destroy
  
  has_one_attached :plan_image
  
  def get_plan_image(width, height)
    unless plan_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      plan_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    plan_image.variant(resize_to_limit: [width, height]).processed
  end
  
end
