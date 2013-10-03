Ronin.class_eval do
  get '/' do
    haml :index, :format => :html5
  end
end
