require 'test_helper'

class EstadisticaprestamosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get estadisticaprestamos_index_url
    assert_response :success
  end

  test "should get show" do
    get estadisticaprestamos_show_url
    assert_response :success
  end

end
