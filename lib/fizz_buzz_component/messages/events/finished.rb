module FizzBuzzComponent
  module Messages
    module Events
      class Finished
        include Messaging::Message

        attribute :game_id, String
        attribute :time, String
      end
    end
  end
end
