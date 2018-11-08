require_relative '../../automated_init'

context "Projection" do
  context "Turn Taken" do
    context "First Turn Is Taken" do
      turn_taken = Controls::Events::TurnTaken.example

      game = Controls::Game::New.example
      counter = game.counter or fail

      Projection.(game, turn_taken)

      context "Attributes" do
        test "ID" do
          game_id = turn_taken.game_id or fail

          assert(game.id == game_id)
        end

        test "Counter is increased by one" do
          assert(game.counter == counter + 1)
        end

        test "Time is converted and copied to started time" do
          turn_taken_time_iso8601 = turn_taken.time
          turn_taken_time = Clock.parse(turn_taken_time_iso8601)

          assert(game.started_time == turn_taken_time)
        end
      end
    end
  end
end
