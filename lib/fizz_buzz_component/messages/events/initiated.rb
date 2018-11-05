module FizzBuzzComponent
  module Messages
    module Events
      class Initiated
        include Messaging::Message

        attribute :game_id, String
        attribute :time, String
        attribute :processed_time, String
      end
    end
  end
end
