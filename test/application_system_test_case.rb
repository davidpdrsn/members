require "test_helper"
require "capybara/poltergeist"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :poltergeist

  include HttpBasicAuthHelper
  include AuthenticationHelper
end
