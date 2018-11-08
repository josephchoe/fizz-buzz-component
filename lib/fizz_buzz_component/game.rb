module FizzBuzzComponent
  class Game
    include Schema::DataStructure

    attribute :id, String
    attribute :counter, Integer, default: 0
    attribute :started_time, Time
    attribute :ended_time, Time

    def take_turn(time)
      self.counter += 1

      if counter == 1
        self.started_time = time
      end
    end

    def correct?(answer)
      next_counter = counter + 1

      if next_counter % 3 == 0 && next_counter % 5 == 0
        answer == 'FizzBuzz'

      elsif next_counter % 3 == 0
        answer == 'Fizz'

      elsif next_counter % 5 == 0
        answer == 'Buzz'

      else
        answer == next_counter.to_s
      end
    end

    def ended?
      !ended_time.nil?
    end

    def over?
      ended? || counter >= self.class.counter_limit
    end

    def self.counter_limit
      100
    end
  end
end
