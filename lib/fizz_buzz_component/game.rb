module FizzBuzzComponent
  class Game
    include Schema::DataStructure

    attribute :id, String

    attribute :counter, Integer

    attribute :initiated_time, Time
    attribute :finished_time, Time
  end
end
