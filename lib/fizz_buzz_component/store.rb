module FizzBuzzComponent
  class Store
    include EntityStore

    category :fizz_buzz
    reader MessageStore::Postgres::Read
    projection Projection
    entity Game
  end
end
