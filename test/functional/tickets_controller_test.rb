require 'test_helper'

class TicketsControllerTest < ActionController::TestCase
  setup do
    @ticket = tickets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tickets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ticket" do
    assert_difference('Ticket.count') do
      post :create, ticket: { citation_number: @ticket.citation_number, issued_at: @ticket.issued_at, user_id: @ticket.user_id }
    end

    assert_response 201
  end

  test "should show ticket" do
    get :show, id: @ticket
    assert_response :success
  end

  test "should update ticket" do
    put :update, id: @ticket, ticket: { citation_number: @ticket.citation_number, issued_at: @ticket.issued_at, user_id: @ticket.user_id }
    assert_response 204
  end

  test "should destroy ticket" do
    assert_difference('Ticket.count', -1) do
      delete :destroy, id: @ticket
    end

    assert_response 204
  end
end
