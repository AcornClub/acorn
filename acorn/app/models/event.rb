class Event < ApplicationRecord
  belongs_to :member
  # belongs_to :event_type
  # belongs_to :image, foreign_key: :cover_image_id
    scope :on_date, ->(date) { where('start_at <= ? AND end_at >= ?', date.to_date.end_of_day, date.to_date.beginning_of_day).order(start_at: :asc) }


private

 class << self
    def ransackable_scopes(_date = nil)
      %i(on_date)
    end
  end
end
