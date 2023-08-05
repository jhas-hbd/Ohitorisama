class Tag < ApplicationRecord
  has_many :plan_tag_relations, dependent: :destroy
  has_many :plans, through: :plan_tag_relations
end
