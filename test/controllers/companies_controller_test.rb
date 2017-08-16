require 'test_helper'

class CompaniesControllerTest < ActionDispatch::IntegrationTest

  include Devise::Test::ControllerHelpers

  test "should get index" do
		get :index
		assert_response :success
		#assert_not  :companies
	end
end
