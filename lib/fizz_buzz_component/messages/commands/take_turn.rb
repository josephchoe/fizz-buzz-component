module FizzBuzzComponent
  module Messages
    module Commands
      class TakeTurn
        include Messaging::Message

        attribute :game_id, String
        attribute :answer, String
        attribute :time, String
      end
    end
  end
end
