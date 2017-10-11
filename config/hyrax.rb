Hyrax.config do |config|
  # When an admin set is created, we need to activate a workflow.
  # The :default_active_workflow_name is the name of the workflow we will activate.
  # @see Hyrax::Configuration for additional details and defaults.
  config.default_active_workflow_name = 'default'
end
