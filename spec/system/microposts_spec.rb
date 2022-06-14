require 'rails_helper'

RSpec.describe "Microposts", type: :system do
  let(:user) { FactoryBot.create(:user) }

  before do
    @user = FactoryBot.create(:user, :with_posts)
    log_in_as @user
  end

  describe '' do
    it 'ページネーション要素を保持しているか' do
      expect(page).to have_selector "div.pagination"
    end

    it '１ページの投稿数が３０であること' do
      posts_container = within 'ol.microposts' do
        find_all('li')
      end
      expect(posts_container.length).to eq 30
    end

    it '投稿の番号をカウントする' do
      expect(page).to have_content @user.microposts.count.to_s
    end

    it '投稿内容を表示する' do
      @user.microposts.paginate(page: 1).each do |micropost|
        expect(page).to have_content micropost.content
      end
    end

    it 'h1タグが表示されていること' do
      expect(page).to have_selector('h1', text: 'マイページ')
    end

    it 'ページネーションの表示が１度のみ' do
      expect(find_all("div.pagination").length).to eq 1
    end
  end
end