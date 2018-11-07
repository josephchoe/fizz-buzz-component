module FizzBuzzComponent
  module Messages
    module Events
      class Answered
        include Messaging::Message

        attribute :game_id, String

        attribute :counter, Integer
        attribute :answer, String

        attribute :time, String
        attribute :processed_time, String
      end
    end
  end
end
