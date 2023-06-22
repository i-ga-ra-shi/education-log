require 'rails_helper'

RSpec.describe Student, type: :model do
  before do
    @student = FactoryBot.build(:student)
  end

  describe '生徒が登録できる' do
    context '生徒が登録できる場合' do
      it "grade,class_number,number,name,user_idが存在すれば保存できる" do
        expect(@student).to be_valid
      end
    end
    context '生徒が登録できない場合' do
      it "gradeが空だと保存できない" do
        @student.grade = ""
        @student.valid?
        expect(@student.errors.full_messages).to include("Grade can't be blank")
      end
      it "class_numberが空だと保存できない" do
        @student.class_number = ""
        @student.valid?
        expect(@student.errors.full_messages).to include("Class number can't be blank")
      end
      it "class_numberが文字列だと保存できない" do
        @student.class_number = "aaa"
        @student.valid?
        expect(@student.errors.full_messages).to include("Class number is not a number")
      end
      it "numberが空だと保存できない" do
        @student.number = ""
        @student.valid?
        expect(@student.errors.full_messages).to include("Number can't be blank")
      end
      it "numberが文字列だと保存できない" do
        @student.number = ""
        @student.valid?
        expect(@student.errors.full_messages).to include("Number can't be blank")

      end
      it "nameが空だと保存できない" do
        @student.name = ""
        @student.valid?
        expect(@student.errors.full_messages).to include("Name can't be blank")
      end
      it "userが紐づいていないと保存できない" do
        @student.user = nil
        @student.valid?
        expect(@student.errors.full_messages).to include("User must exist")
      end
    end
  end  
end
