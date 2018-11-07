module FizzBuzzComponent
  class Projection
    include EntityProjection
    include Messages::Events

    entity_name :game
  end
end
