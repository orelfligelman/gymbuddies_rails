require 'test_helper'

class ButtsControllerTest < ActionController::TestCase
  setup do
    @butt = butts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:butts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create butt" do
    assert_difference('Butt.count') do
      post :create, butt: { fart: @butt.fart, location: @butt.location, name: @butt.name, percentbodysize: @butt.percentbodysize, shape: @butt.shape }
    end

    assert_redirected_to butt_path(assigns(:butt))
  end

  test "should show butt" do
    get :show, id: @butt
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @butt
    assert_response :success
  end

  test "should update butt" do
    patch :update, id: @butt, butt: { fart: @butt.fart, location: @butt.location, name: @butt.name, percentbodysize: @butt.percentbodysize, shape: @butt.shape }
    assert_redirected_to butt_path(assigns(:butt))
  end

  test "should destroy butt" do
    assert_difference('Butt.count', -1) do
      delete :destroy, id: @butt
    end

    assert_redirected_to butts_path
  end
end
