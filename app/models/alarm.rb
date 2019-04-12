class Alarm < ApplicationRecord
  scope :ordered, -> { order(created_at: :desc) }

  validate :description_must_be_upper_case

  def description=(value)
    self[:description]= value&.upcase
  end

  def description_must_be_upper_case
    errors.add(:base, 'description must be upper case') if description.upcase != description
  end

  def epoch_seconds
    Time.zone.now.to_i - created_at.to_i
  end

  def score
    order = Math.log10([vote_counter.to_f, 1].max) * 10
    (order + epoch_seconds).round(7)
  end
end
