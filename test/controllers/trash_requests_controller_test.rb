require 'test_helper'

class TrashRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trash_request = trash_requests(:one)
  end

  test "should get index" do
    get trash_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_trash_request_url
    assert_response :success
  end

  test "should create trash_request" do
    assert_difference('TrashRequest.count') do
      post trash_requests_url, params: { trash_request: { request_generate_date: @trash_request.request_generate_date, request_status: @trash_request.request_status, total_amount: @trash_request.total_amount, tr_serial_no: @trash_request.tr_serial_no, trash_request_date: @trash_request.trash_request_date } }
    end

    assert_redirected_to trash_request_url(TrashRequest.last)
  end

  test "should show trash_request" do
    get trash_request_url(@trash_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_trash_request_url(@trash_request)
    assert_response :success
  end

  test "should update trash_request" do
    patch trash_request_url(@trash_request), params: { trash_request: { request_generate_date: @trash_request.request_generate_date, request_status: @trash_request.request_status, total_amount: @trash_request.total_amount, tr_serial_no: @trash_request.tr_serial_no, trash_request_date: @trash_request.trash_request_date } }
    assert_redirected_to trash_request_url(@trash_request)
  end

  test "should destroy trash_request" do
    assert_difference('TrashRequest.count', -1) do
      delete trash_request_url(@trash_request)
    end

    assert_redirected_to trash_requests_url
  end
end
