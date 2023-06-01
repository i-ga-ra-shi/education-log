class Subject < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    mount_uploader :file, AvatarUploader
    belongs_to :choose_subject
    belongs_to :user

    validates :subject_id, numericality: { other_than: 1, message: "can't be blank" }

    def self.search(keyword)
        if keyword.present?
            subjects = ["国語","社会","数学","理科","英語","その他の教科","特別活動"]
            if subjects.include?(keyword)
                index = subjects.index(keyword)
                Subject.where('title LIKE ? OR name LIKE ? OR content LIKE ? OR subject_id = ?', "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "#{index+2}")
            else
                Subject.where('title LIKE ? OR name LIKE ? OR content LIKE ?', "%#{keyword}%", "%#{keyword}%", "%#{keyword}%")
            end
        else
            Subject.all
        end
    end
end
