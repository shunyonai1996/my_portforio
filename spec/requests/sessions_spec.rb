require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  let(:user) { FactoryBot.create(:user) }
  before do
    post login_path, params: { session: { email: user.email, password: user.password } }
  end

  describe "get /login" do
    it "HTTPリクエストに成功する" do
      get login_path
      expect(response).to have_http_status :success
    end
  end

  describe "delete /logout" do
    it 'ログアウトできること' do
      expect(logged_in?).to be_truthy

      delete logout_path
      expect(logged_in?).to_not be_truthy
    end

    it '２回連続ログアウトしてもエラーにならないこと' do
      delete logout_path
      delete logout_path
      expect(response).to redirect_to root_path
    end
  end

  describe "#create" do
    it 'remember_meがONの場合、cookies[:remember_token]が空でないこと' do
      post login_path, params: { session: { email: user.email, password: user.password, remember_me: 1 } }
      expect(cookies[:remember_token]).to_not be_blank
    end

    it 'remember_meがOFFの場合、cookies[:remember_token]が空であること' do
      post login_path, params: { session: { email: user.email, password: user.password, remember_me: 0 } }
      expect(cookies[:remember_token]).to be_blank
    end
  end
end
