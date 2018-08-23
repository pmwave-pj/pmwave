class ApplicationRecord < ActiveRecord::Base
self.abstract_class = true
self.record_timestamps = false
TrnTaskDetail.transaction do
  TrnTaskDetail.order(row_order: :desc).each do |task|
    task.update_attribute :row_order_position, 0
  end
end
self.record_timestamps = true
end
