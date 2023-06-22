require 'rails_helper'

RSpec.describe Subject, type: :model do
  before do
    @subject = FactoryBot.build(:subject)
  end

  describe '授業記録投稿' do
    context '新規投稿できる場合' do
      it "subject_id,sub_subject,title,month_id,grade_id,name,content,user_idが存在すれば登録できる" do
        expect(@subject).to be_valid
      end
      it "sub_subjectは空でも登録できる" do
        @subject.sub_subject = ""
        expect(@subject).to be_valid
      end
    end
    context '新規投稿できない場合' do
      it "subject_idが1では登録できない" do
        @subject.subject_id = 1
        @subject.valid?
        expect(@subject.errors.full_messages).to include("Subject can't be blank")
      end
      it "titleが空では登録できない" do
        @subject.title = ""
        @subject.valid?
        expect(@subject.errors.full_messages).to include("Title can't be blank")
      end
      it "month_idが1では登録できない" do
        @subject.month_id = 1
        @subject.valid?
        expect(@subject.errors.full_messages).to include("Month can't be blank")
      end
      it "grade_idが1では登録できない" do
        @subject.grade_id = 1
        @subject.valid?
        expect(@subject.errors.full_messages).to include("Grade can't be blank")
      end
      it "nameが空では登録できない" do
        @subject.name = ""
        @subject.valid?
        expect(@subject.errors.full_messages).to include("Name can't be blank")
      end
      it "contentが空では登録できない" do
        @subject.content = ""
        @subject.valid?
        expect(@subject.errors.full_messages).to include("Content can't be blank")
      end
      it "userが紐づいていなければ登録できない" do
        @subject.user = nil
        @subject.valid?
        expect(@subject.errors.full_messages).to include("User must exist")
      end
    end
  end
end