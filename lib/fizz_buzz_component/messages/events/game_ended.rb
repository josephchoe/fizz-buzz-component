module FizzBuzzComponent
  module Messages
    module Events
      class GameEnded
        include Messaging::Message

        attribute :game_id, String
        attribute :time, String
      end
    end
  end
end
