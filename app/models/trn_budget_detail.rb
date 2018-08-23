class TrnBudgetDetail < ApplicationRecord

  validates :pj_id, presence: true
  validates :bg_title, presence: true, length: { maximum: 50 }

end
