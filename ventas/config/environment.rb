# Load the rails application
require File.expand_path('../application', __FILE__)
Ventas::Application.configure  do
	config.gem "calendar_date_select"
end

# Initialize the rails application
Ventas::Application.initialize!
