# require 'rack-livereload'
require 'rubygems'
require 'bundler'
Bundler.require
# use Rack::LiveReload

class Ronin < Sinatra::Base
  set :root, File.dirname(__FILE__) # You must set app root
  set :scss, { :load_paths => [ "#{Ronin.root}/assets/stylesheets", "#{Ronin.root}/vendor/stylesheets" ] }
  enable :logging if settings.environment == :development

  register Sinatra::AssetPack

  assets do
    serve '/js',     from: 'assets/javascripts'
    serve '/css',    from: 'assets/stylesheets'
    serve '/images', from: 'assets/images'    # Default

    # The second parameter defines where the compressed version will be served.
    # (Note: that parameter is optional, AssetPack will figure it out.)
    js :app, [
      '/js/vendor/**/*.js',
      '/js/lib/**/*.js'
    ]

    css :main, [
      '/css/main.css'
    ]

    js_compression  :jsmin    # :jsmin | :yui | :closure | :uglify
    css_compression :scss   # :simple | :sass | :yui | :sqwish
    cache_dynamic_assets true
    prebuild true
  end
end

require './routes.rb'

run Ronin
