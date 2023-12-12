class Task < ApplicationRecord
  validates :title, presence: true
  validates :deadline, presence: true

  validate :deadline_cannot_be_in_the_past

  validates :isDone, inclusion: { in: [true, false] }
  attribute :isDone, :boolean, default: false

  private

  def deadline_cannot_be_in_the_past
    errors.add(:deadline, "can't be in the past") if deadline.present? && deadline < Date.today
  end
end
