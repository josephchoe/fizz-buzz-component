ENV['CONSOLE_DEVICE'] ||= 'stdout'
ENV['LOG_LEVEL'] ||= '_min'

require_relative '../init.rb'

require 'test_bench'; TestBench.activate

require 'pp'

require 'fizz_buzz_component/controls'

include FizzBuzzComponent
