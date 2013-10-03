guard 'coffeescript', :input => 'coffeescripts'

# Sample guardfile block for Guard::Haml
# You can use some options to change guard-haml configuration
# :output => 'public'                   set output directory for compiled files
# :input => 'src'                       set input directory with haml files
# :run_at_start => true                 compile files when guard starts
# :notifications => true                send notifictions to Growl/libnotify/Notifu
# :haml_options => { :ugly => true }    pass options to the Haml engine

guard 'haml', :output => :public do
  watch(/^.+(\.html\.haml)/)
end

guard 'livereload' do
  watch(%r{views/.+\.(erb|haml|slim)$})
  watch(%r{helpers/.+\.rb})
  watch(%r{public/.+\.(css|js|html)})
  watch(%r{assets/.+/[^_].+\.(css|scss|js|coffeescript)$})
  watch(%r{config/locales/.+\.yml})
end

guard 'sass', :input => 'sass', :output => 'public/stylesheets', :load_paths => ['sass', 'vendor/stylesheets/'], :smart_partials => true


# Add files and commands to this file, like the example:
#   watch(%r{file/path}) { `command(s)` }
#
guard 'shell' do
  watch(%r{assets/stylesheets/.+\.(css|scss)$}) do |m| 
    `touch assets/stylesheets/main.scss` unless m[0] == 'assets/stylesheets/main.scss'
  end
end
