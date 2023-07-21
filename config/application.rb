require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Rails7EncryptionTest
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.active_record.encryption.primary_key = 'VZjQAa1ROkdANvgeIOwJ0VYH3RGe6LC8'
    config.active_record.encryption.deterministic_key = '351aouRwq81Qt00xHN5rRrATNUhU6fpK'
    config.active_record.encryption.key_derivation_salt = 'VnRRUDhyv3NHWyxIrvTYcNYsxNUJH9OB'
    config.active_record.encryption.algorithm = "aes-256-cbc"

    # Temporary setting while legacy plain text data is still being converted
    # - Steve Zelaznik, July 17th 2023
    config.active_record.encryption.support_unencrypted_data = true
    config.active_record.encryption.extend_queries = true
  end
end
