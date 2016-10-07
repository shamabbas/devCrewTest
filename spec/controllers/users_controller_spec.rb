class UsersControllerTest < ActionController::TestCase
  setup do
    default = {:provider => :facebook,
               :uuid     => "12345678",
               :facebook => {
                   :email => "test@devcrewexample.com",
                   :name => "devCrew_test"
               }
    }
    opts = {}
    credentials = default.merge(opts)
    provider = credentials[:provider]
    user_hash = credentials[provider]

    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[provider] = {
        'uid' => credentials[:uuid],
        "extra" => {
            "user_hash" => {
                "email" => user_hash[:email],
                "name" => user_hash[:name]
            }
        }
    }
  end

  test "should get index" do
    get :index
    assert_response :success
  end
end