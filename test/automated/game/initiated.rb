require_relative '../automated_init'

context "Game" do
  context "Has Initiated Time" do
    game = Controls::Game.example

    refute(game.initiated_time.nil?)

    test "Is initiated" do
      assert(game.initiated?)
    end
  end

  context "Does Not Have Initiated Time" do
    game = Controls::Game::New.example

    assert(game.initiated_time.nil?)

    test "Is not initiated" do
      refute(game.initiated?)
    end
  end
end
