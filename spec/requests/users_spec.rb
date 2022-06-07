require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "POST /users #create" do
    context '無効な値の場合' do
    it "新規登録失敗のテスト" do
      expect {
        post users_path, params: { user: { name:                  "",
                                           email:                 "user@invalid",
                                           birthday:              "1996/10",
                                           password:              "foo",
                                           password_confirmation: "bar" } }
        }.to_not change(User, :count)
        end
      end
    end
    
    context '有効な値の場合' do
      let(:user_params) { {user: { name:                 "Example User",
                                  email:                 "user@example.com",
                                  birthday:              "1996/10/10",
                                  password:              "foobar",
                                  password_confirmation: "foobar",
                                  admin:                  true,
                                  activated:              true,
                                  activated_at: Time.zone.now } } } 
                                  
      before do
        ActionMailer::Base.deliveries.clear
      end
        
      it "新規登録成功のテスト" do
        expect {
          post users_path, params: user_params
        }.to change(User, :count).by(1)
      end

      it 'メールが１件存在すること' do
        post users_path, params: user_params
        expect(ActionMailer::Base.deliveries.size).to eq 1
      end



      it 'users/rootへのリダイレクト' do
        post users_path, params: user_params
        # user = User.last
        expect(response).to redirect_to root_url
      end

      it 'flashをテストする'do
        post users_path, params: user_params
        expect(flash).to be_any
      end

      it 'ログイン状態であること' do
        post users_path, params: user_params
        expect(logged_in?).to be_truthy
      end
    end

  describe '#edit' do
    let(:user) { FactoryBot.create(:user) }
    let(:other_user) { FactoryBot.create(:user, :other) }
    
    context '未ログインの場合' do
      it 'ログインしていない場合、編集画面にアクセスできず、リダイレクトされる' do
        get edit_user_path(user)
        expect(flash[:danger]).to eq 'ログインしてください'
        expect(response).to redirect_to login_path
      end
    end

    context '別ユーザの場合' do
      it '別ユーザの編集画面にアクセスしようとすると、root_urlにリダイレクトされる' do
        log_in_as(user)
        get edit_user_path(other_user)
        expect(flash[:danger]).to eq nil
        expect(response).to redirect_to root_path
      end
    end

    it '一般ユーザーは管理者権限の付与ができない' do
      log_in_as(user)
      expect(other_user.admin?).to_not be_truthy
      patch user_path(other_user), params: {
        user: { password:              "password",
                password_confirmation: "password",
                admin: true } }
      expect(other_user.admin?).to_not be_truthy
    end
  end
  
  describe '#update' do
    let(:user) { FactoryBot.create(:user) }
    it 'ログインしていない場合、編集を更新できず、リダイレクトされる' do
      patch user_path(user)
      expect(flash[:danger]).to eq 'ログインしてください'
      expect(response).to redirect_to login_path
    end
  end

end
