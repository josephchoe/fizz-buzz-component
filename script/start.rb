#!/usr/bin/env ruby

require_relative '../init'

require 'component_host'

ComponentHost.start('fizz-buzz') do |host|
  host.register(FizzBuzzComponent::Start)
end
