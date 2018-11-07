module FizzBuzzComponent
  class Projection
    include EntityProjection
    include Messages::Events

    entity_name :game

    apply Answered do |answered|
      game.id = answered.game_id

      # TODO - Logic in a projection like this is wrong
      if answered.counter == 1
        answered_time_iso8601 = answered.time
        answered_time = Clock.parse(answered_time_iso8601)

        game.initiated_time = answered_time
      end

      game.advance
    end
  end
end
