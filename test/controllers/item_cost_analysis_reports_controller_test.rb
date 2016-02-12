require 'test_helper'

class ItemCostAnalysisReportsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
