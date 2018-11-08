module FizzBuzzComponent
  class Projection
    include EntityProjection
    include Messages::Events

    entity_name :game

    apply TurnTaken do |turn_taken|
      game.id ||= turn_taken.game_id

      turn_taken_time_iso8601 = turn_taken.time
      turn_taken_time = Clock.parse(turn_taken_time_iso8601)

      game.take_turn(turn_taken_time)
    end

    apply GameEnded do |game_ended|
      ended_time_iso8601 = game_ended.time
      ended_time = Clock.parse(ended_time_iso8601)

      game.ended_time = ended_time
    end
  end
end
