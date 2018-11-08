require_relative '../../automated_init'

context "Commands" do
  context "Take Turn" do
    context "Previous Message" do
      previous_message = Controls::Message.example

      game_id = Controls::Game.id
      answer = Controls::Answer.example

      take_turn = Commands::TakeTurn.new

      take_turn.(previous_message: previous_message, game_id: game_id, answer: answer)

      writer = take_turn.write

      take_turn_message = writer.one_message do |message|
        message.instance_of?(Messages::Commands::TakeTurn)
      end
      refute(take_turn_message.nil?)

      test "Take turn message follows previous message" do
        assert(take_turn_message.follows?(previous_message))
      end
    end
  end
end
