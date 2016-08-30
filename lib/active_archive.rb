require 'rails'
require 'active_archive/version'
require 'active_archive/configuration'

module ActiveArchive

  class << self
    attr_accessor :configuration

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end
  end

  class Railtie < ::Rails::Railtie

    initializer 'active_archive' do |app|
      ActiveArchive::Railtie.instance_eval do
        [app.config.i18n.available_locales].flatten.each do |locale|
          (I18n.load_path << path(locale)) if File.file?(path(locale))
        end
      end
    end

    protected

    def path(locale)
      File.expand_path("../../config/locales/#{locale}.yml", __FILE__)
    end

  end
end

require 'active_archive/table_definition'
require 'active_archive/methods'
require 'active_archive/scopes'
require 'active_archive/base'
require 'generators/active_archive/install_generator'

ActiveSupport.on_load(:active_record) do
  ActiveRecord::Base.include(ActiveArchive::Base)
end
