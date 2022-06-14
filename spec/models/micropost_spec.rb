require 'rails_helper'

RSpec.describe 'Micropost', type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:micropost) { FactoryBot.create(:micropost) }

  describe '投稿内容のテスト' do
    it '有効な投稿かどうか' do
      expect(micropost).to be_valid
    end

    it '投稿にuser_idが含まれていること' do
      micropost.user_id = nil
      expect(micropost).not_to be_valid
    end

    it 'contentが空でないこと' do
      micropost.content = "    "
      expect(micropost).not_to be_valid
    end

    it 'contentが２００文字以内であること' do
      micropost.content = "a" * 201
      expect(micropost).not_to be_valid
    end

    it '投稿の順序が降順になっているか' do
      create_posts_defferent_posting_time
      Micropost.all.each { |m| puts m.user_id }
      expect(FactoryBot.create(:micropost, :most_recent)).to eq Micropost.first
    end
  end

  describe 'association' do
    it 'ユーザを削除すると、投稿も削除される' do
      user = micropost.user
      expect {
        user.destroy
      }.to change(Micropost, :count).by(-1)
    end
  end
end
