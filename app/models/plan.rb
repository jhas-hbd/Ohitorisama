class Plan < ApplicationRecord
  belongs_to :user
  has_many :days, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  has_many :plan_tag_relations, dependent: :destroy
  has_many :tags, through: :plan_tag_relations, dependent: :destroy

  enum prefecture:{
    都道府県:0,
    北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
    徳島県:36,香川県:37,愛媛県:38,高知県:39,
    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,
    沖縄県:47
  }

  enum stay_days:{
    宿泊日数:0,
    日帰り:1,一泊二日:2,二泊三日:3,三泊四日:4,四泊～:5
  }

  enum budget:{
    予算:0,
    "～1万":1,"1万～2万":2,"2万～3万":3,"3万～4万":4,"4万～5万":5,"5万～":6
  }

  enum main_vehicle:{
    主な移動手段:0,
    自動車:1,公共交通機関:2,それ以外:3
  }

  has_one_attached :plan_image

  def get_plan_image(width, height)
    unless plan_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      plan_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    plan_image.variant(resize_to_limit: [width, height]).processed
  end

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

end
