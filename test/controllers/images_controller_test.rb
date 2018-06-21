require './test/test_helper'
class ImagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get root_path
    assert_response :success
    assert_select 'p', 'Hello Bhargav!'
  end
end
