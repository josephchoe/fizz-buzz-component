require_relative '../automated_init'

context "Projection" do
  context "Game Ended" do
    game_ended = Controls::Events::GameEnded.example

    game = Controls::Game.example
    assert(game.ended_time.nil?)

    Projection.(game, game_ended)

    test "Ended time is converted and copied" do
      ended_time_iso8601 = game_ended.time
      ended_time = Clock.parse(ended_time_iso8601)

      assert(game.ended_time == ended_time)
    end
  end
end
