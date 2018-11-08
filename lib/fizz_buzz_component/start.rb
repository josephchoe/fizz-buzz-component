module FizzBuzzComponent
  module Start
    def self.call
      category = 'fizzBuzz'

      command_category_stream = Messaging::StreamName.command_category_stream_name(category)
      Consumers::Commands.start(command_category_stream)

      event_category_stream = Messaging::StreamName.category_stream_name(category)
      Consumers::Events.start(event_category_stream)
    end
  end
end
