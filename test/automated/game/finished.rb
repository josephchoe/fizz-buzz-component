require_relative '../automated_init'

context "Game" do
  context "Has Finished Time" do
    game = Controls::Game::Finished.example

    refute(game.finished_time.nil?)

    test "Is finished" do
      assert(game.finished?)
    end
  end

  context "Does Not Have Finished Time" do
    game = Controls::Game.example

    assert(game.finished_time.nil?)

    test "Is not finished" do
      refute(game.finished?)
    end
  end
end
