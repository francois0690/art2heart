require 'test_helper'

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get transactions_create_url
    assert_response :success
  end

  test "should get destroy" do
    get transactions_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get transactions_edit_url
    assert_response :success
  end

  test "should get index" do
    get transactions_index_url
    assert_response :success
  end

  test "should get new" do
    get transactions_new_url
    assert_response :success
  end

  test "should get show" do
    get transactions_show_url
    assert_response :success
  end

  test "should get update" do
    get transactions_update_url
    assert_response :success
  end

end
