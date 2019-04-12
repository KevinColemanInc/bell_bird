class Alarm < ApplicationRecord
  scope :ordered, -> { order(created_at: :desc) }

  validate :description_must_be_upper_case

  def description=(value)
    self[:description]= value&.upcase
  end

  def description_must_be_upper_case
    errors.add(:base, 'description must be upper case') if description.upcase != description
  end
end
