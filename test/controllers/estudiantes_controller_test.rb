require 'test_helper'

class EstudiantesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get estudiantes_new_url
    assert_response :success
  end

  test "should get create" do
    get estudiantes_create_url
    assert_response :success
  end

end
