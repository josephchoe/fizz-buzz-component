module FizzBuzzComponent
  class Game
    include Schema::DataStructure

    attribute :id, String
    attribute :counter, Integer
    attribute :started_time, Time
    attribute :finished_time, Time

    def started?
      !started_time.nil?
    end

    def start(started_time)
      self.counter = 1

      self.started_time = started_time
    end

    def answer?(answer)
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

    def answer(answered_time)
      if counter < 100
        self.counter += 1
      else
        self.finished_time = answered_time
      end
    end

    def finished?
      !finished_time.nil?
    end

    def finish(finished_time)
      self.finished_time = finished_time
    end
  end
end
