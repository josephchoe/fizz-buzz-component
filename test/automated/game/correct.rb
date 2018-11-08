require_relative '../automated_init'

context "Game" do
  context "Correct Predicate" do
    context "Counter Is Not Divisible by Three or Five" do
      counter = 1

      game = Controls::Game.example(counter: counter)

      context "Correct" do
        test "#{counter}" do
          assert(game.correct?(counter.to_s))
        end
      end

      context "Incorrect" do
        ["Fizz", "Buzz", "FizzBuzz"].each do |value|
          test "#{value.inspect}" do
            refute(game.correct?(counter))
          end
        end
      end
    end

    context "Counter Is Divisible by Three" do
      counter = 6

      game = Controls::Game.example(counter: counter)

      context "Correct" do
        test '"Fizz"' do
          assert(game.correct?('Fizz'))
        end
      end

      context "Incorrect" do
        [counter, "Buzz", "FizzBuzz"].each do |value|
          test "#{value.inspect}" do
            refute(game.correct?(counter))
          end
        end
      end
    end

    context "Counter Is Divisible by Five" do
      counter = 10

      game = Controls::Game.example(counter: counter)

      context "Correct" do
        test '"Buzz"' do
          assert(game.correct?('Buzz'))
        end
      end

      context "Incorrect" do
        [counter, "Fizz", "FizzBuzz"].each do |value|
          test "#{value.inspect}" do
            refute(game.correct?(counter))
          end
        end
      end
    end

    context "Counter Is Divisible by Three and Five" do
      counter = 15

      game = Controls::Game.example(counter: counter)

      context "Correct" do
        test '"FizzBuzz"' do
          assert(game.correct?('FizzBuzz'))
        end
      end

      context "Incorrect" do
        [counter, "Fizz", "Buzz"].each do |value|
          test "#{value.inspect}" do
            refute(game.correct?(counter))
          end
        end
      end
    end
  end
end
