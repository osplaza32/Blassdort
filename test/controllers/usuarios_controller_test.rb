require 'test_helper'

class UsuariosControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get get" do
    get :get
    assert_response :success
  end

end
