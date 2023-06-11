class Attendance < ApplicationRecord


    validates :name, :status, :start_time, :reason, presence: true
end
