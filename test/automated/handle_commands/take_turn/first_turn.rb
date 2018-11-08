require_relative '../../automated_init'

context "Handle Commands" do
  context "Take Turn" do
    context "First Turn" do
      handler = Handlers::Commands.new

      take_turn = Controls::Commands::TakeTurn::Initial.example

      game_id = take_turn.game_id or fail

      handler.(take_turn)

      writer = handler.write

      turn_taken = writer.one_message do |message|
        message.instance_of?(Messages::Events::TurnTaken)
      end

      test "Turn taken event is written" do
        refute(turn_taken.nil?)
      end
    end
  end
end
