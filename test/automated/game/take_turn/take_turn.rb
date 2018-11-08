require_relative '../../automated_init'

context "Game" do
  context "Take Turn" do
    counter = Controls::Counter.example

    game = Controls::Game.example(counter: counter)
    assert(game.counter == counter)

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
