module FizzBuzzComponent
  class Game
    include Schema::DataStructure

    attribute :id, String

    attribute :counter, Integer

    attribute :initiated_time, Time
    attribute :finished_time, Time

    def initiated?
      !initiated_time.nil?
    end

    def advance
      self.counter += 1
    end

    def next_answer?(answer)
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

    def finished?
      !finished_time.nil?
    end
  end
end
