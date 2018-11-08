module FizzBuzzComponent
  module Handlers
    class Output
      include Messaging::Handle
      include Messages::Events

      handle TurnTaken do |turn_taken|
        message = "Turn taken successfully (Turn: #{turn_taken.counter}, Answer: #{turn_taken.answer})"

        formatted_message = TerminalColors::Apply.(message, fg: :green)

        puts formatted_message
      end

      handle TurnRejected do |turn_rejected|
        message = "Turn failed (Turn: #{turn_rejected.counter}, Answer: #{turn_rejected.answer})"

        formatted_message = TerminalColors::Apply.(message, fg: :white, bg: :red)

        puts formatted_message
      end
    end
  end
end
