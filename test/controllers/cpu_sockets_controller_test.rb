require 'test_helper'

class CpuSocketsControllerTest < ActionController::TestCase
  setup do
    @cpu_socket = cpu_sockets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cpu_sockets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cpu_socket" do
    assert_difference('CpuSocket.count') do
      post :create, cpu_socket: { name: @cpu_socket.name }
    end

    assert_redirected_to cpu_socket_path(assigns(:cpu_socket))
  end

  test "should show cpu_socket" do
    get :show, id: @cpu_socket
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cpu_socket
    assert_response :success
  end

  test "should update cpu_socket" do
    patch :update, id: @cpu_socket, cpu_socket: { name: @cpu_socket.name }
    assert_redirected_to cpu_socket_path(assigns(:cpu_socket))
  end

  test "should destroy cpu_socket" do
    assert_difference('CpuSocket.count', -1) do
      delete :destroy, id: @cpu_socket
    end

    assert_redirected_to cpu_sockets_path
  end
end
