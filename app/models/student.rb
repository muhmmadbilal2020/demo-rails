class Student < ApplicationRecord

  validates :name, presence: true
  validates :age, presence: true
  validates :sex, presence: true
  validates :city, presence: true

end
