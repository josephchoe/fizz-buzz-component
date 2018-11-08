require_relative '../automated_init'

context "Game" do
  context "Over Predicate" do
    counter_limit = Game.counter_limit

    context "Does Not Have Ended Time" do
      context "Counter Has Reached Limit" do
        game = Controls::Game.example(counter: counter_limit)

        assert(game.ended_time.nil?)

        test "Game is over" do
          assert(game.over?)
        end
      end

      context "Counter Has Exceeded Limit" do
        counter = counter_limit + 1

        game = Controls::Game.example(counter: counter)

        assert(game.ended_time.nil?)

        test "Game is over" do
          assert(game.over?)
        end
      end

      context "Counter Has Not Reached Limit" do
        counter = counter_limit - 1

        game = Controls::Game.example(counter: counter)

        assert(game.ended_time.nil?)

        test "Game is not over" do
          refute(game.over?)
        end
      end
    end

    context "Has Ended Time" do
      game = Controls::Game::Ended.example

      refute(game.ended_time.nil?)
      assert(game.counter < counter_limit)

      test "Is over" do
        assert(game.over?)
      end
    end
  end
end
