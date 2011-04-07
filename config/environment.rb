# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Bookit::Application.initialize!

# Gravatar plugin tweaking
GravatarHelper::DEFAULT_OPTIONS[:default] = 'wavatar'
GravatarHelper::DEFAULT_OPTIONS[:size]    = 80

