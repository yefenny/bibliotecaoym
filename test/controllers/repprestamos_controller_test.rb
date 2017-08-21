require 'test_helper'

class RepprestamosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get repprestamos_index_url
    assert_response :success
  end

end
