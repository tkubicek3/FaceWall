require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

require 'rubocop/rake_task'

RuboCop::RakeTask.new(:rubocop) do |task|
  task.patterns = ['app/models', 'app/controllers', 'app/helpers']
  task.fail_on_error = false
end
