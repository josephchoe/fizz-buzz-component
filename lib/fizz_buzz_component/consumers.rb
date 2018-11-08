module FizzBuzzComponent
  module Consumers
    class Commands
      include Consumer::Postgres

      handler Handlers::Commands
    end

    class Events
      include Consumer::Postgres

      handler Handlers::Events
      handler Handlers::Output
    end
  end
end
