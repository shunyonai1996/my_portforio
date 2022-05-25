require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe '#create' do
    context '無効な値の場合' do
      it '登録失敗時のflashが表示される' do
        visit signup_path
        fill_in "user_name",         with: ''
        fill_in "user_email",        with: 'user@invalid'
        fill_in "user_birthday",     with: '1996-10-28'
        fill_in "user_password",     with: 'foo'
        fill_in "user_password_confirmation", with: 'bar'
        click_button '登録'

        expect(page).to have_selector 'div.field_with_errors'
        expect(page).to have_selector 'div.alert-danger'
      end
    end
  end
end