module ApiSpecHelper
  def parsed_json_response_body
    JSON.parse(response.body)
  end
end

# make this module "included" across request spec files
RSpec.configure do |config|
  config.include ApiSpecHelper, type: :request
end
