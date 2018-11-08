require_relative '../../automated_init'

context "Game" do
  context "Take Turn" do
    control_counter = Controls::Counter.example

    game = Controls::Game.example(counter: control_counter)
    assert(game.counter == control_counter)

    counter = control_counter + 1

    time = game.started_time + 1

    game.take_turn(counter, time)

    test "Counter is set" do
      assert(game.counter == counter)
    end

    test "Started time is not changed" do
      refute(game.started_time == time)
    end
  end
end
