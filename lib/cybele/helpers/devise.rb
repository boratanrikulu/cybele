# frozen_string_literal: true

module Cybele
  module Helpers
    module Devise
      def generate_devise_settings
        generate 'devise:install'
        gsub_file 'config/initializers/filter_parameter_logging.rb', /:password/,
                  ':password, :password_confirmation'
        gsub_file 'config/initializers/devise.rb',
                  /please-change-me-at-config-initializers-devise@example.com/, "no-reply@#{app_name}.com"
        inject_into_file 'config/initializers/devise.rb', after: "# config.mailer = 'Devise::Mailer'\n" do
          template_content('devise/devise_mailer.rb.erb')
        end
      end

      def generate_devise_models
        generate 'devise User name:string surname:string is_active:boolean time_zone:string'
        generate 'devise Admin name:string surname:string is_active:boolean time_zone:string'
        remove_file 'config/locales/devise.en.yml', force: true
      end

      def generate_devise_views
        directory 'devise/devise_views', 'app/views/devise'
      end

      def add_devise_authenticate_admin
        inject_into_file 'app/controllers/hq/application_controller.rb',
                         template_content('devise/devise_authenticate_admin.rb.erb'),
                         after: 'class Hq::ApplicationController < ApplicationController'
      end

      def add_devise_strong_parameter
        inject_into_file 'app/controllers/application_controller.rb',
                         template_content('devise/devise_strong_parameter.rb.erb'),
                         after: 'protect_from_forgery with: :exception'

        inject_into_file 'app/controllers/application_controller.rb',
                         template_content('devise/devise_before_action_strong_parameter.rb.erb'),
                         after: 'class ApplicationController < ActionController::Base'
      end
    end
  end
end
