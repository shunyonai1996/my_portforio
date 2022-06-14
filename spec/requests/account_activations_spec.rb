require 'rails_helper'

RSpec.describe "AccountActivations", type: :request do
  describe "GET /index" do
    let(:user) { FactoryBot.create(:user) }
    let(:mail) { UserMailer.account_activation(user) }

    before do
      # post users_path, params: { user: { name: 'ExampleUser',
      #                                    id: ,
      #                                    email: 'user@example.com',
      #                                    password: 'password',
      #                                    password_confirmation: 'password' } }

      @user = controller.instance_variable_get('@user')
    end
  
    context 'トークンとemailが有効な場合' do
      it 'activateされること' do
        get edit_account_activation_path(user.activation_token, email: user.email)
        user.reload
        expect(user.activated?).to be_truthy
      end
      
      it 'ログイン状態になる' do
        visit edit_account_activation_path(user.activation_token, email: user.email)
        user.reload
        expect(logged_in?).to be_truthy
      end
      
      it 'ユーザ詳細ページにリダイレクトすること' do
        get edit_account_activation_path(user.activation_token, email: user.email)
        user.reload
        expect(response).to redirect_to users_path(user)
      end
    end
  end
end
