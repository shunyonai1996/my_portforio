require 'rails_helper'

RSpec.describe SessionsHelper, type: :helper do
  let(:user) { FactoryBot.create(:user) }

  describe 'current_user' do
    before do
      remember(user)
    end

    it 'sessionがnilの時current_userが正しいユーザを返す' do
      expect(current_user).to eq user
      expect(logged_in?).to be_truthy
    end

    it '記憶ダイジェストと記憶トークンが一致しないとnilを返す' do
      user.update_attribute(:remember_digest, User.digest(User.new_token))
      expect(current_user).to eq nil
    end
  end
end
