module FizzBuzzComponent
  class Game
    include Schema::DataStructure

    attribute :id, String
    attribute :counter, Integer
    attribute :started_time, Time
    attribute :ended_time, Time

    def take_turn(counter, time)
      if self.counter.nil?
        self.started_time = time
      end

      self.counter = counter
    end

    def correct?(answer)
      if counter % 3 == 0 && counter % 5 == 0
        answer == 'FizzBuzz'

      elsif counter % 3 == 0
        answer == 'Fizz'

      elsif counter % 5 == 0
        answer == 'Buzz'

      else
        answer == counter.to_s
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
