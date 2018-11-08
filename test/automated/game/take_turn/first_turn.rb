require_relative '../../automated_init'

context "Game" do
  context "Take Turn" do
    context "First Turn Is Taken" do
      game = Controls::Game::New.example

      assert(game.counter == 0)
      assert(game.started_time.nil?)

      time = Controls::Time::Effective::Raw.example

      game.take_turn(time)

      test "Counter is set to one" do
        assert(game.counter == 1)
      end

      test "Started time is set" do
        assert(game.started_time == time)
      end
    end
  end
end
