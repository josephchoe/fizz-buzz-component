require_relative '../automated_init'

context "Game" do
  context "Correct Predicate" do
    context "Next Counter Is Not Divisible by Three or Five" do
      next_counter = 1

      game = Controls::Game.example(next_counter: next_counter)

      context "Correct" do
        test "#{next_counter}" do
          assert(game.correct?(next_counter.to_s))
        end
      end

      context "Incorrect" do
        ["Fizz", "Buzz", "FizzBuzz"].each do |value|
          test "#{value.inspect}" do
            refute(game.correct?(next_counter))
          end
        end
      end
    end

    context "Next Counter Is Divisible by Three" do
      next_counter = 6

      game = Controls::Game.example(next_counter: next_counter)

      context "Correct" do
        test '"Fizz"' do
          assert(game.correct?('Fizz'))
        end
      end

      context "Incorrect" do
        [next_counter, "Buzz", "FizzBuzz"].each do |value|
          test "#{value.inspect}" do
            refute(game.correct?(next_counter))
          end
        end
      end
    end

    context "Next Counter Is Divisible by Five" do
      next_counter = 10

      game = Controls::Game.example(next_counter: next_counter)

      context "Correct" do
        test '"Buzz"' do
          assert(game.correct?('Buzz'))
        end
      end

      context "Incorrect" do
        [next_counter, "Fizz", "FizzBuzz"].each do |value|
          test "#{value.inspect}" do
            refute(game.correct?(next_counter))
          end
        end
      end
    end

    context "Next Counter Is Divisible by Three and Five" do
      next_counter = 15

      game = Controls::Game.example(next_counter: next_counter)

      context "Correct" do
        test '"FizzBuzz"' do
          assert(game.correct?('FizzBuzz'))
        end
      end

      context "Incorrect" do
        [next_counter, "Fizz", "Buzz"].each do |value|
          test "#{value.inspect}" do
            refute(game.correct?(next_counter))
          end
        end
      end
    end
  end
end
