require 'coveralls'
Coveralls.wear!

require 'simplecov'

SimpleCov.configure do
  add_filter 'spec/'

  add_group 'Sandbox' do |src|
    !src.filename.start_with?('sicuro/runtime')
  end

  add_group 'Runtime', 'runtime/'
end
SimpleCov.start unless ENV['TRAVIS']

require 'bundler/setup'

require 'rspec'

require 'sicuro'


def capture(*streams)
  streams.map! { |stream| stream.to_s }
  begin
    result = StringIO.new
    streams.each { |stream| eval "$#{stream} = result" }
    yield
  ensure
    streams.each { |stream| eval("$#{stream} = #{stream.upcase}") }
  end
  result.string
end
