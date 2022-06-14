require 'rails_helper'

RSpec.describe "Microposts", type: :request do
  describe 'POST /microposts' do
    it '非ログインユーザが投稿を削除できないこと' do
      expect { 
        post microposts_path, params: { micropost: { content: 'test' } }
      }.not_to change(Micropost, :count)
      redirect_to login_path
    end
  end
end