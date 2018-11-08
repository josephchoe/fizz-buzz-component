require_relative '../../automated_init'

context "Commands" do
  context "Take Turn" do
    game_id = Controls::Game.id
    answer = Controls::Answer.example
    effective_time = Controls::Time::Effective::Raw.example

    take_turn = Commands::TakeTurn.new
    take_turn.clock.now = effective_time

    take_turn.(game_id: game_id, answer: answer)

    writer = take_turn.write

    take_turn_message = writer.one_message do |message|
      message.instance_of?(Messages::Commands::TakeTurn)
    end

    test "Take turn command is written" do
      refute(take_turn_message.nil?)
    end

    test "Written to the fizz buzz command stream" do
      control_stream_name = Controls::StreamName::FizzBuzz::Command.example(game_id: game_id)

      written_to_stream = writer.written?(take_turn_message) do |stream_name|
        stream_name == control_stream_name
      end

      assert(written_to_stream)
    end

    context "Attributes" do
      test "Game ID" do
        assert(take_turn_message.game_id == game_id)
      end

      test "Answer" do
        assert(take_turn_message.answer == answer)
      end

      test "Time" do
        effective_time_iso8601 = Clock.iso8601(effective_time)

        assert(take_turn_message.time == effective_time_iso8601)
      end
    end
  end
end
