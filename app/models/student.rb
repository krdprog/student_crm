class Student < ApplicationRecord
  validates :first_name, length: { maximum: 40 }, presence: true
  validates :middle_name, length: { maximum: 60 }
  validates :last_name, length: { maximum: 40 }, presence: true
  validates :gender, presence: true
  validates :signal, uniqueness: true, length: { minimum: 6, maximum: 16 }, if: :signal?

  enum gender: {
    male: 0,
    female: 1
  }

  def full_name
    if middle_name.present?
      "#{last_name} #{first_name} #{middle_name}"
    else
      " #{last_name} #{first_name}"
    end
  end
end
