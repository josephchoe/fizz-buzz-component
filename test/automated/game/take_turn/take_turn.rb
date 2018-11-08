require_relative '../../automated_init'

context "Game" do
  context "Take Turn" do
    game = Controls::Game.example
    counter = game.counter or fail

    time = game.started_time + 1

    game.take_turn(time)

    test "Counter is increased by one" do
      assert(game.counter == counter + 1)
    end

    test "Started time is not changed" do
      refute(game.started_time == time)
    end
  end
end
