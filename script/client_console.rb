#!/usr/bin/env ruby

require_relative '../init'

module ExampleClient
  extend self

  def game_id
    @game_id ||=
      begin
        if File.exist?(game_id_path)
          File.read(game_id_path)
        else
          game_id = SecureRandom.alphanumeric(5)

          File.write(game_id_path, game_id)

          game_id
        end
      end
  end

  def game_id_path
    File.join('tmp/game_id')
  end

  def number(number)
    FizzBuzzComponent::Commands::TakeTurn.(
      game_id: game_id,
      answer: number.to_s
    )

    :sent
  end

  def fizz
    FizzBuzzComponent::Commands::TakeTurn.(
      game_id: game_id,
      answer: 'Fizz'
    )

    :sent
  end

  def buzz
    FizzBuzzComponent::Commands::TakeTurn.(
      game_id: game_id,
      answer: 'Buzz'
    )

    :sent
  end

  def fizz_buzz
    FizzBuzzComponent::Commands::TakeTurn.(
      game_id: game_id,
      answer: 'FizzBuzz'
    )

    :sent
  end

  def start
    require 'irb'
    require 'irb/completion'

    puts <<~TEXT
      FizzBuzz Client

      Usage:

        - To submit a number as the next answer, use the `number' method:
          > number(11)

        - To submit `Fizz' or `Buzz' as the next answer, use the methods
          `fizz' and `buzz', respectively:
          > fizz
          > buzz

        - To submit `FizzBuzz' as the next answer, use the `fizz_buzz' method:
          > fizz_buzz

    TEXT

    IRB.setup(Dir.pwd)

    IRB.conf.update({
      :IRB_NAME => 'FizzBuzz',
      :PROMPT_MODE => :CLASSIC
    })

    irb_workspace = IRB::WorkSpace.new(binding)

    irb = IRB::Irb.new(irb_workspace)

    irb.run
  end
end

ExampleClient.start
