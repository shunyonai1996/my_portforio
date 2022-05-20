require 'rails_helper'

RSpec.describe "UsersSignups", type: :request do
  describe "GET /users_signups" do
    it "新規登録のURLの取得" do
      get signup_path
      expect(response).to have_http_status(200)
    end

    it "新規登録失敗のテスト" do
      assert_no_difference 'User.count' do
        post users_path, params: {user: { name:  "",
                                  email: "user@invalid",
                                  birthday: "1996/10",
                                  password:              "foo",
                                  password_confirmation: "bar" } }
        end
      end

    it "新規登録成功のテスト" do
      assert_difference 'User.count', 1 do
        post users_path, params: {user: { name:  "Example User",
                                  email: "user@example.com",
                                  birthday: "1996/10/10",
                                  password:              "foobar",
                                  password_confirmation: "foobar" } }
                                  subject { response }
      end
      is_expected.to redirect_to user_path(User.last)
      # is_expected.to have_http_status 302
    end

    it "flashが空か" do
      get signup_path
      assert flash.empty?
    end

  end
end
