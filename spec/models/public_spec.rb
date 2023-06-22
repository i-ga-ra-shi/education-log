require 'rails_helper'

RSpec.describe Public, type: :model do
  before do
    @public = FactoryBot.build(:public)
  end

  describe '公開テーブルに保存できる' do
    context '公開テーブルに保存できる場合' do
      it "userとsubjectが紐づいていれば保存できる" do
        expect(@public).to be_valid
      end
    end
    context '公開テーブルに保存できない場合' do
      it "userが紐づいていなければ登録できない" do
        @public.user = nil
        @public.valid?
        expect(@public.errors.full_messages).to include("User must exist")
      end
      it "subjectが紐づいていなければ登録できない" do
        @public.subject = nil
        @public.valid?
        expect(@public.errors.full_messages).to include("Subject must exist")
      end
    end
  end  
end
