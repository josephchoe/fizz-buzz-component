require_relative '../../automated_init'

context "Projection" do
  context "Answered" do
    game = Controls::Game.example
    counter = game.counter or fail
    initiated_time = game.initiated_time or fail

    answered_time = initiated_time + 1
    answered_time_iso8601 = Clock.iso8601(answered_time)

    answered = Controls::Events::Answered.example(time: answered_time_iso8601)

    Projection.(game, answered)

    context "Attributes" do
      test "Counter is advanced by one" do
        assert(game.counter == counter + 1)
      end

      test "Initiated time is not changed" do
        assert(game.initiated_time == initiated_time)
      end
    end
  end
end
