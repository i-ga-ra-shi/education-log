class Student < ApplicationRecord
    belongs_to :user

    validates :grade, :class_number, :number, :name, :user, presence: true
    validates :class_number, numericality: { only_integer: true }
end
