def set_omniauth(opts = {})
  default = {:provider => :facebook,
             :uuid     => "12345678",
             :facebook => {
                 :email => "test@devexample.com",
                 :name => "devcrew123"
             }
  }

  credentials = default.merge(opts)
  provider = credentials[:provider]
  user_hash = credentials[provider]

  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[provider] = {
      'uid' => credentials[:uuid],
      "extra" => {
          "user_hash" => {
              "email" => user_hash[:email],
              "name" => user_hash[:first_name]
          }
      }
  }
end

def set_invalid_omniauth(opts = {})

  credentials = { :provider => :facebook,
                  :invalid  => :invalid_crendentials
  }.merge(opts)

  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[credentials[:provider]] = credentials[:invalid]

end