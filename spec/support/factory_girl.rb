# (Ash) This file with lint factories that will be defined i.e, ensure factories I define will be valid
# But FactoryGirl.lint may persist data in the db
# So database cleaner will restore the state of the database after we've linted our factories

RSpec.configured do |config|
  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    begin
      DatabaseCleaner.start
      FactoryGirl.lint
    ensure
      DatabaseCleaner.clean
    end
  end
end
