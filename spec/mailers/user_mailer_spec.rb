require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "account_activation" do
    let(:user) { FactoryBot.create(:user) }
    let(:mail) { UserMailer.account_activation(user) }

    before do
      user.activation_token = User.new_token
    end

    it "タイトルが期待した文字列で送信されること" do
      expect(mail.subject).to eq("アカウント有効化リンクを送信しました")
    end
    
    it "送信先が期待通りのアドレスであること" do
      expect(mail.to).to eq(["test@example.com"])
    end
    
    it "送信元が期待通りのアドレスであること" do
      expect(mail.from).to eq(["sample@example.com"])
    end

    it "メール本文にユーザ名が表示されていること" do
      expect(mail.html_part.body.encoded).to match(user.name)
      expect(mail.text_part.body.encoded).to match(user.name)
    end
    
    it "activation_tokenが本文に含まれている" do
      expect(mail.html_part.body.encoded).to match(user.activation_token)
      expect(mail.text_part.body.encoded).to match(user.activation_token)
    end

    it "特殊文字をエスケープしたuser.mailが本文に含まれている" do
      expect(mail.html_part.body.encoded).to match(CGI.escape(user.email))
      expect(mail.text_part.body.encoded).to match(CGI.escape(user.email))
    end
  end

  describe "password_reset" do
    let(:mail) { UserMailer.password_reset }

    it "renders the headers" do
      expect(mail.subject).to eq("Password reset")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["sample@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
