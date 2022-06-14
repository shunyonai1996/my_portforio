require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|

  config.include LoginSupport
  
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!

  require 'support/factory_bot'
  
  # テストケース共通の事前処理
  config.before do

    # let(:rspec_session) で指定された値を セッションの初期値とします
    session = defined?(rspec_session) ? rspec_session : {}

    # destroyメソッドを実行してもエラーにならないようにします（必要であれば）
    session.class_eval { def destroy; nil; end }

    # 追記 実行後のセッションを取得できるようにする
    config.add_setting(:session, :default => session)

    # 変更 sessionメソッドをRSpec.configuration.sessionで上書き
    allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return(RSpec.configuration.session)
  end
end
