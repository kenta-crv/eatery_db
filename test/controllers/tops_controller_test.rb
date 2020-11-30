require 'test_helper'

class TopsControllerTest < ActionDispatch::IntegrationTest
  test "should get price" do
    get tops_price_url
    assert_response :success
  end

  test "should get company" do
    get tops_company_url
    assert_response :success
  end

  test "should get question" do
    get tops_question_url
    assert_response :success
  end

  test "should get servise" do
    get tops_servise_url
    assert_response :success
  end

end
