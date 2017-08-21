require 'test_helper'

class BuscarControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get buscar_show_url
    assert_response :success
  end

end
