require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
Dotenv::Railtie.load

module RailsShareBlog
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
    # config.session_store :redis_session_store,
    #                      key: "_kittens_session",
    #                      serializer: :json,
    #                      domain: :all,
    #                      redis: {
    #                        expire_after: 1.week,
    #                        key_prefix: "kittens:session:",
    #                        url: ENV["REDIS_SESSIONS_URL"],
    #                      }
    # config.session_store :cookie_store,
    #                      key: "great_session",
    #                      domain: :all
    config.session_store :cookie_store,
                         key: "_share_blog_session_id"
                        #  domain: :all,
                        #  same_site: :none,
                        #  secure: :true,
                        #  tld_length: 3
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use config.session_store, config.session_options

    # config.middleware.use ActionDispatch::Cookies
    # config.middleware.use ActionDispatch::Session::CookieStore
  end
end
