require 'test_helper'

class ItemsSoldsControllerTest < ActionController::TestCase
  setup do
    @items_sold = items_solds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:items_solds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create items_sold" do
    assert_difference('ItemsSold.count') do
      post :create, items_sold: { cantidad: @items_sold.cantidad, id_sale: @items_sold.id_sale }
    end

    assert_redirected_to items_sold_path(assigns(:items_sold))
  end

  test "should show items_sold" do
    get :show, id: @items_sold
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @items_sold
    assert_response :success
  end

  test "should update items_sold" do
    patch :update, id: @items_sold, items_sold: { cantidad: @items_sold.cantidad, id_sale: @items_sold.id_sale }
    assert_redirected_to items_sold_path(assigns(:items_sold))
  end

  test "should destroy items_sold" do
    assert_difference('ItemsSold.count', -1) do
      delete :destroy, id: @items_sold
    end

    assert_redirected_to items_solds_path
  end
end
