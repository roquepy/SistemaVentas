require 'rubygems'

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
#RAILS_ROOT = "#{File.dirname(FILE)}/.." unless defined?(RAILS_ROOT)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

