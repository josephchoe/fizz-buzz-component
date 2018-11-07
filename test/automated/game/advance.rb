require_relative '../automated_init'

context "Game" do
  context "Advance" do
    counter = Controls::Counter.example

    game = Controls::Game.example(counter: counter)
    assert(game.counter == counter)

    game.advance

    test "Counter is increased by one" do
      assert(game.counter == counter + 1)
    end
  end
end
