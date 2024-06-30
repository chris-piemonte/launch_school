require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require "yaml"

before do
  @data = YAML.load_file('users.yaml')
  @names = @data.keys.map { |name| name.to_s }
end

helpers do
  def count_interests
    @data.values.reduce(0) { |total, info| total += info[:interests].count }
  end
end

get "/" do
  @test = "test"

  erb :home
end

get "/user/:name" do
  @name = params[:name]
  @info = @data[@name.to_sym]

  erb :user
end

