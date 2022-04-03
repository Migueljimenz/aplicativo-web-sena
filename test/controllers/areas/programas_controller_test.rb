require "test_helper"

class Areas::ProgramasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get areas_programas_index_url
    assert_response :success
  end

  test "should get show" do
    get areas_programas_show_url
    assert_response :success
  end
end
