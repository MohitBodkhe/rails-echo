require "test_helper"

class OtpVerificationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get otp_verifications_new_url
    assert_response :success
  end

  test "should get create" do
    get otp_verifications_create_url
    assert_response :success
  end
end
