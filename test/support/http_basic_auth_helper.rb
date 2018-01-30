module HttpBasicAuthHelper
  def http_basic_authenticate
    page.driver.basic_authorize(
      ENV.fetch("BASIC_AUTH_USERNAME"),
      ENV.fetch("BASIC_AUTH_PASSWORD"),
    )
  end
end
