class Student < ApplicationRecord
  validates :first_name, length: { maximum: 40 }, presence: true
  validates :middle_name, length: { maximum: 60 }
  validates :last_name, length: { maximum: 40 }, presence: true

  def full_name
    if middle_name.present?
      "#{first_name} #{middle_name} #{last_name}"
    else
      "#{first_name} #{last_name}"
    end
  end
end
