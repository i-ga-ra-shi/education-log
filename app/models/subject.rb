class Subject < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    mount_uploader :file, AvatarUploader
    belongs_to :user
    belongs_to :choose_subject
    belongs_to :month
    belongs_to :grade
    has_one :public, dependent: :destroy

    validates :subject_id, :month_id, :grade_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :title, :name, :content, presence: true

    scope :latest, -> {order(created_at: :desc)}
    scope :old, -> {order(created_at: :asc)}
    scope :subject_id, -> {order(subject_id: :asc)}
    scope :month_id, -> {order(month_id: :asc)}
    scope :grade_id, -> {order(grade_id: :asc)}
    scope :subject_name, ->(subject_id) { where("subject_id = ?", subject_id) }

    def self.search(keyword)
        if keyword.present?
            Subject.where('sub_subject LIKE ? OR title LIKE ? OR name LIKE ? OR content LIKE ?', "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%")
        else
            Subject.includes(:user)
        end
    end
end


