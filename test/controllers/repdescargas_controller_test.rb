require 'test_helper'

class RepdescargasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get repdescargas_index_url
    assert_response :success
  end

  test "should get create" do
    get repdescargas_create_url
    assert_response :success
  end

end
