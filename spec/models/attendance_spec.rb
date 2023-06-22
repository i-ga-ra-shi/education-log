require 'rails_helper'

RSpec.describe Attendance, type: :model do
  before do
    @attendance = FactoryBot.build(:attendance)
  end

  describe '出欠情報が保存' do
    context '出欠情報が保存できる場合' do
      it "status,start_time,reason,user_id,sutudent_idが存在すれば登録できる" do
        expect(@attendance).to be_valid
      end
    end
    context '公開テーブルに保存できない場合' do
      it "statusが空だと登録できない" do
        @attendance.status = ""
        @attendance.valid?
        expect(@attendance.errors.full_messages).to include("Status can't be blank")
      end
      it "start_timeが空だと登録できない" do
        @attendance.start_time = ""
        @attendance.valid?
        expect(@attendance.errors.full_messages).to include("Start time can't be blank")
      end
      it "reasonが空だと登録できない" do
        @attendance.reason = ""
        @attendance.valid?
        expect(@attendance.errors.full_messages).to include("Reason can't be blank")
      end
      it "useが紐づいていなければ登録できない" do
        @attendance.user = nil
        @attendance.valid?
        expect(@attendance.errors.full_messages).to include("User must exist")
      end
      it "studenttが紐づいていなければ登録できない" do
        @attendance.student = nil
        @attendance.valid?
        expect(@attendance.errors.full_messages).to include("Student must exist")

      end
    end
  end
end
