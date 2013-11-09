require 'json'
require 'sinatra'

get '/' do
  send_file File.join(settings.public_folder, 'index.html')
end

get '/:numbers' do
  n = params[:numbers].split(',').map { |n| n.to_i }
  n.bogosort!
  n.to_json
end

module Enumerable
  def bogosort!
    shuffle! until sorted?
  end

  def sorted?
    each_cons(2).all? { |a, b| (a <=> b) <= 0 }
  end
end
