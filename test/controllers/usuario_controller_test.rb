require 'test_helper'

class UsuarioControllerTest < ActionController::TestCase
  test "should get perfil" do
    get :perfil
    assert_response :success
  end

  test "should get editar" do
    get :editar
    assert_response :success
  end

end
