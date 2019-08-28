ENV['SINATRA_ENV'] ||= "development"
ENV['SESSION_SECRET'] ||= "wakanda4ever"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])


require './app/controllers/application_controller'
require_all 'app'


configure :production do
  db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')

  ActiveRecord::Base.establish_connection(
    :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'uft8'
  )
end
