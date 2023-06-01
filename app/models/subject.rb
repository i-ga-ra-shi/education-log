class Subject < ApplicationRecord
    belongs_to :user

    def self.search(keyword)
        if keyword.present?
            Subject.where('subject LIKE ? OR title LIKE ? OR name LIKE ? OR content LIKE ?', "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%")
        else
            Subject.all
        end
    end
end
