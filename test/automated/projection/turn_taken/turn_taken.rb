require_relative '../../automated_init'

context "Projection" do
  context "Turn Taken" do
    turn_taken = Controls::Events::TurnTaken.example

    game = Controls::Game.example
    counter = game.counter or fail

    Projection.(game, turn_taken)

    test "Counter is increased by one" do
      assert(game.counter == counter + 1)
    end
  end
end
