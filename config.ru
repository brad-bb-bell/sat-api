# This file is used by Rack-based servers to start the application.

require_relative "config/environment"

ENV['APP_BASE'] = File.expand_path('..', __FILE__)
require ::File.expand_path('../config/environment',  __FILE__)

run Rails.application
Rails.application.load_server
