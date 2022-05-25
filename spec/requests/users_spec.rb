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
                                  password_confirmation: "foobar" } } } 
        
      it "新規登録成功のテスト" do
        expect {
          post users_path, params: user_params
        }.to change(User, :count).by(1)
      end

      it 'users/showへのリダイレクト' do
        post users_path, params: user_params
        user = User.last
        expect(response).to redirect_to user
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
end
