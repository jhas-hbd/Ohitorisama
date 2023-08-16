class Plan < ApplicationRecord
  belongs_to :user
  has_many :days, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  has_many :plan_tag_relations, dependent: :destroy
  has_many :tags, through: :plan_tag_relations, dependent: :destroy

  validates :prefecture, presence: true
  validates :stay_days, presence: true
  validates :budget, presence: true
  validates :main_vehicle, presence: true
  validates :title, presence: true
  validates :impression, length: { maximum: 140 }

  Plan.includes(:day).order("days.day ASC")

  enum prefecture:{
    北海道:0,青森県:1,岩手県:2,宮城県:3,秋田県:4,山形県:5,福島県:6,
    茨城県:7,栃木県:8,群馬県:9,埼玉県:10,千葉県:11,東京都:12,神奈川県:13,
    新潟県:14,富山県:15,石川県:16,福井県:17,山梨県:18,長野県:19,
    岐阜県:20,静岡県:21,愛知県:22,三重県:23,
    滋賀県:24,京都府:25,大阪府:26,兵庫県:27,奈良県:28,和歌山県:29,
    鳥取県:30,島根県:31,岡山県:32,広島県:33,山口県:34,
    徳島県:35,香川県:36,愛媛県:37,高知県:38,
    福岡県:39,佐賀県:40,長崎県:41,熊本県:42,大分県:43,宮崎県:44,鹿児島県:45,
    沖縄県:46
  }

  enum stay_days:{
    日帰り:0,一泊二日:1,二泊三日:2,三泊四日:3,四泊～:4
  }

  enum budget:{
    "～1万":0,"1万～2万":1,"2万～3万":2,"3万～4万":3,"4万～5万":4,"5万～":5
  }

  enum main_vehicle:{
    自動車:0,公共交通機関:1,それ以外:2
  }

  has_many_attached :plan_images
  FILE_NUMBER_LIMIT = 5
  validate :validate_number_of_files

  # def get_plan_image
  #   (plan_image.attached?) ? plan_image : 'no_plan.jpg'
  # end

  def bookmarked_by?(user)
    bookmarks.exists?(user_id: user.id)
  end

  def save_tags(tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name:old_name)
    end
    new_tags.each do |new_name|
      tag = Tag.find_or_create_by(name:new_name)
      self.tags << tag
    end
  end


  private

  def validate_number_of_files
    return if plan_images.length <= FILE_NUMBER_LIMIT
    errors.add(:plan_images, "に添付できる画像は#{FILE_NUMBER_LIMIT}件までです。")
  end

end
