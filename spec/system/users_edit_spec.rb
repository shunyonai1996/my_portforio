require 'rails_helper'

RSpec.describe "Users", type: :system do
  describe 'PATCH /users' do
    let(:user) { FactoryBot.create(:user) }
    
    it 'プロフィール編集の更新に失敗する' do
      log_in_as(user)
      click_on 'プロフィールを編集'
      fill_in "user_name",         with: ''
      fill_in "user_email",        with: 'user@invalid'
      fill_in "user_birthday",     with: '001996-10-28'
      fill_in "user_work_span",    with: ''
      fill_in "user_password",     with: 'foo'
      fill_in "user_password_confirmation", with: 'bar'
      click_button '変更を保存'
      expect(page).to have_current_path user_path(user)
    end
    
    it 'プロフィール編集の更新に成功する' do
      log_in_as(user)
      click_on 'プロフィールを編集'
      fill_in "user_name",         with: 'test'
      fill_in "user_email",        with: 'test@test.com'
      fill_in "user_birthday",     with: '001996-10-28'
      fill_in "user_work_span",    with: ''
      fill_in "user_password",     with: ''
      fill_in "user_password_confirmation", with: ''
      click_on '変更を保存'
      expect(page).to have_content("プロフィールを更新しました")
      expect(page).to have_current_path user_path(user)
      user.reload
      expect(user.name).to eq 'test'
      expect(user.email).to eq 'test@test.com'
    end
    
    it 'ログインすると、編集画面にリダイレクトされる' do
      visit edit_user_path(user)
      # expect(RSpec.configuration.session[:forwarding_url]).to eq 'http://www.example.com' + edit_user_path(user)
      expect(login_url).to be_truthy
      fill_in 'メールアドレス', with: user.email
      fill_in 'パスワード', with: user.password
      click_button 'ログイン'
      visit current_path
      expect(page).to have_current_path edit_user_path(user)
      fill_in "user_name",         with: 'test'
      fill_in "user_email",        with: 'test@test.com'
      fill_in "user_birthday",     with: '001996-10-28'
      fill_in "user_work_span",    with: ''
      fill_in "user_password",     with: ''
      fill_in "user_password_confirmation", with: ''
      click_on '変更を保存'
      expect(page).to have_content("プロフィールを更新しました")
      expect(page).to have_current_path user_path(user)
      user.reload
      expect(user.name).to eq 'test'
      expect(user.email).to eq 'test@test.com'
    end
  end
end
  