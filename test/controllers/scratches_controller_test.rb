require 'test_helper'

class ScratchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scratch = scratches(:one)
  end

  test "should get index" do
    get scratches_url
    assert_response :success
  end

  test "should get new" do
    get new_scratch_url
    assert_response :success
  end

  test "should create scratch" do
    assert_difference('Scratch.count') do
      post scratches_url, params: { scratch: { items: @scratch.items, name: @scratch.name, task_group_id: @scratch.task_group_id } }
    end

    assert_redirected_to scratch_url(Scratch.last)
  end

  test "should show scratch" do
    get scratch_url(@scratch)
    assert_response :success
  end

  test "should get edit" do
    get edit_scratch_url(@scratch)
    assert_response :success
  end

  test "should update scratch" do
    patch scratch_url(@scratch), params: { scratch: { items: @scratch.items, name: @scratch.name, task_group_id: @scratch.task_group_id } }
    assert_redirected_to scratch_url(@scratch)
  end

  test "should destroy scratch" do
    assert_difference('Scratch.count', -1) do
      delete scratch_url(@scratch)
    end

    assert_redirected_to scratches_url
  end
end
