# Fix for Ldp::Conflict / Ldp::Gone
# https://github.com/samvera/hyrax/issues/3128#issuecomment-439967751
::Noid::Rails.config.identifier_in_use = lambda do |id|
  ActiveFedora::Base.exists?(id) || ActiveFedora::Base.gone?(id)
end
