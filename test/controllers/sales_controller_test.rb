require 'test_helper'

class SalesControllerTest < ActionController::TestCase
  setup do
    @sale = sales(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sale" do
    assert_difference('Sale.count') do
      post :create, sale: { active: @sale.active, cantidad_pagos: @sale.cantidad_pagos, estatus: @sale.estatus, fecha_venta: @sale.fecha_venta, id_client: @sale.id_client, id_financing_models: @sale.id_financing_models, id_financing_types: @sale.id_financing_types, id_item: @sale.id_item, id_paid_system: @sale.id_paid_system }
    end

    assert_redirected_to sale_path(assigns(:sale))
  end

  test "should show sale" do
    get :show, id: @sale
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sale
    assert_response :success
  end

  test "should update sale" do
    patch :update, id: @sale, sale: { active: @sale.active, cantidad_pagos: @sale.cantidad_pagos, estatus: @sale.estatus, fecha_venta: @sale.fecha_venta, id_client: @sale.id_client, id_financing_models: @sale.id_financing_models, id_financing_types: @sale.id_financing_types, id_item: @sale.id_item, id_paid_system: @sale.id_paid_system }
    assert_redirected_to sale_path(assigns(:sale))
  end

  test "should destroy sale" do
    assert_difference('Sale.count', -1) do
      delete :destroy, id: @sale
    end

    assert_redirected_to sales_path
  end
end
