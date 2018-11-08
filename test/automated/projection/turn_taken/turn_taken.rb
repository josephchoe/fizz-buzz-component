require_relative '../../automated_init'

context "Projection" do
  context "Turn Taken" do
    turn_taken = Controls::Events::TurnTaken.example

    counter = turn_taken.counter

    game = Controls::Game.example(counter: counter - 1)

    Projection.(game, turn_taken)

    test "Counter is set" do
      assert(game.counter == counter)
    end
  end
end
