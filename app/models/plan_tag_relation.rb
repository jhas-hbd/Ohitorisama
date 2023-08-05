class PlanTagRelation < ApplicationRecord
  belongs_to :plan
  belongs_to :tag
end
