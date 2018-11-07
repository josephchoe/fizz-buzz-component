module FizzBuzzComponent
  module Messages
    module Events
      class AnswerRejected
        include Messaging::Message

        attribute :game_id, String
        attribute :counter, Integer
        attribute :answer, String
        attribute :time, String
      end
    end
  end
end
