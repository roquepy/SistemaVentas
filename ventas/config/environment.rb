# Load the rails application
require File.expand_path('../application', __FILE__)
Ventas::Application.configure  do
	config.gem 'calendar_date_select'
	config.gem 'simple_audit'
	config.i18n.default_locale = :es
end

# Initialize the rails application
Ventas::Application.initialize!
