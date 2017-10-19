Ezid::Client.configure do |config|
  # VT libraries' unique DOI prefix with EZID
  config.default_shoulder = Rails.application.secrets['ezid']['default_shoulder']
  config.user = Rails.application.secrets['ezid']['user']
  config.password = Rails.application.secrets['ezid']['password']
  config.identifier.defaults[:status] = "reserved"
  config.identifier.defaults[:profile] = "datacite"
end
