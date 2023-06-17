class Attendance < ApplicationRecord
    belongs_to :student
    belongs_to :user

    validates :status, :start_time, :reason, presence: true
end
