# (Ash) This file will lint factories that will be defined i.e, ensure factories I define will be valid
# But FactoryBot.lint may persist data in the db
# So database cleaner will restore the state of the database after we've linted our factories

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    begin
      DatabaseCleaner.start
      FactoryBot.lint
    ensure
      DatabaseCleaner.clean
    end
  end
end
