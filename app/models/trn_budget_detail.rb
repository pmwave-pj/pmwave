class TrnBudgetDetail < ApplicationRecord

  validates :pj_id, presence: true
  validates :subpj_id, presence: true
  validates :team_id, presence: true
  validates :pj_name, presence: true, length: { maximum: 50 }
  validates :subpj_name, presence: true, length: { maximum: 50 }
  validates :team_name, presence: true, length: { maximum: 50 }
  validates :bg_title, presence: true, length: { maximum: 50 }

end
