require 'test/unit'
require 'fakerest/userrequests'

class UserRequestsTest < Test::Unit::TestCase
  def test_add_new_user_request
    user_request = FakeRest::UserRequest.new("post", "/customer/1", "body", 200)

    FakeRest::UserRequests.add user_request

    user_requests = FakeRest::UserRequests.user_requests
    
    assert_equal(1, user_requests.size)
    req = user_requests[0]

    assert_equal("post", req.method)
    assert_equal("/customer/1", req.url)
    assert_equal("body", req.body)
    assert_equal(200, req.response_status_code)
  end
end
