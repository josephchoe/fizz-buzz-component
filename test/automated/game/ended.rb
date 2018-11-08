require_relative '../automated_init'

context "Game" do
  context "Has Ended Time" do
    game = Controls::Game::Ended.example

    refute(game.ended_time.nil?)

    test "Is ended" do
      assert(game.ended?)
    end
  end

  context "Does Not Have Ended Time" do
    game = Controls::Game.example

    assert(game.ended_time.nil?)

    test "Is not ended" do
      refute(game.ended?)
    end
  end
end
