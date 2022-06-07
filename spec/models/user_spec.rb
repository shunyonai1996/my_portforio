require 'rails_helper'

RSpec.describe User, type: :model do
  
  let(:user) { User.new(name: "Example User", email: "user@example.com",
                        password: "foobar", password_confirmation: "foobar",
                        birthday: "1996-10-28", job: "税務", work_span: 5) }
                        
  describe 'ユーザー登録情報の整合性' do
    it '有効なUserか' do
      expect(user).to be_valid
    end

    it 'nameが空の場合はエラー' do
      user.name = ""
      expect(user).to_not be_valid
    end

    it 'nameの文字数が50文字を超えるとエラー' do
      user.name = "a" * 51
      expect(user).to_not be_valid
    end
    
    it 'emailが空の場合はエラー' do
      user.email = ""
      expect(user).to_not be_valid
    end

    it 'emailの文字数が200文字を超えるとエラー' do
      user.email = "a" * 189 + "@example.com"
      expect(user).to_not be_valid
    end
    
    it '有効なメールフォーマットの検証' do
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
        first.last@foo.jp alice+bob@baz.cn]
      valid_addresses.map { |valid_address|
        user.email = valid_address
        expect(user).to be_valid, "#{valid_address.inspect} は無効なアドレス"
      }
    end

    it '無効なメールフォーマットの検証' do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example foo@bar_baz.com foo@bar+baz.com]
      invalid_addresses.map { |invalid_address|
        user.email = invalid_address
        expect(user).to_not be_valid, "#{invalid_address.inspect} は有効なアドレス"
      }
    end

    it '重複するメールアドレスを拒否' do
      duplicate_user = user.dup
      duplicate_user.email = user.email.upcase
      user.save!
      expect(duplicate_user).to_not be_valid
    end

    it 'メールアドレスを小文字化するテスト' do
      user.email = "SampLE@eXample.Com"
      user.save!
      expect(user.reload.email).to eq('sample@example.com')
    end

    it 'パスワードが空でないか' do
      user.password = user.password_confirmation = " " * 6
      expect(user).to_not be_valid
    end
    
    it 'パスワードの最小文字数が６文字以上か' do
      user.password = user.password_confirmation = "a" * 5
      expect(user).to_not be_valid
    end
  end

  describe '#authenticated?' do
    it 'ダイジェストがnilなら、authenticated?が失敗する' do
      expect(user.authenticated?(:remember, '')).to be_falsy
    end
  end
end