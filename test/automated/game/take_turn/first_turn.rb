require_relative '../../automated_init'

context "Game" do
  context "Take Turn" do
    context "First Turn Is Taken" do
      game = Controls::Game::New.example

      assert(game.started_time.nil?)

      counter = Controls::Counter.example
      refute(counter == game.counter)

      time = Controls::Time::Effective::Raw.example

      game.take_turn(counter, time)

      test "Counter is set" do
        assert(game.counter == counter)
      end

      test "Started time is set" do
        assert(game.started_time == time)
      end
    end
  end
end
