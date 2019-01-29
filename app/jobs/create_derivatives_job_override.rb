# Attempting to override Hyrax Gem 2.1.0
#   app/jobs/create_derivative_job.rb
#
# LIBTD-1665: Attempting to slow down the retry scheduling
# for derivatives that take longer to create.

module CreateDerivativesJobOverride
  def self.prepended(base)
    base.rescue_from(MiniMagick::Error) do
      retry_job wait: 5.minutes, queue: Hyrax.config.ingest_queue_name
    end
  end
end
