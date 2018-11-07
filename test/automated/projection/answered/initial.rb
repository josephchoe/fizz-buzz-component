require_relative '../../automated_init'

context "Projection" do
  context "Answered" do
    context "Initial" do
      game = Controls::Game::New.example
      counter = game.counter or fail

      answered = Controls::Events::Answered::Initial.example

      Projection.(game, answered)

      context "Attributes" do
        test "Game ID" do
          game_id = answered.game_id or fail

          assert(game.id == game_id)
        end

        test "Counter is advanced by one" do
          assert(game.counter == counter + 1)
        end

        test "Initiated time is converted and copied" do
          answered_time_iso8601 = answered.time or fail
          answered_time = Clock.parse(answered_time_iso8601)

          assert(game.initiated_time == answered_time)
        end
      end
    end
  end
end
