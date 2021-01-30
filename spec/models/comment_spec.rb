require 'rails_helper'

RSpec.describe Comment, type: :model do

  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @comment = FactoryBot.build(:comment, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe 'コメントの保存' do
    context "コメントが保存できる場合" do
      it "テキストが記述されていればツイートは保存される" do
        expect(@comment).to be_valid
      end
    end
    context "コメントが保存できない場合" do
      it "テキストがないとコメントは保存できない" do
        @comment.text = ""
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end
      it "ユーザーが紐付いていないとコメントは保存できない" do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("User must exist")      
      end
      it "作品が紐付いていないとコメントは保存できない" do
        @comment.item = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Item must exist")      
      end
    end
  end

end
