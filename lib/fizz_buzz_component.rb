require 'eventide/postgres'
require 'try'

Configure.activate
Dependency.activate
Initializer.activate

require 'fizz_buzz_component/game'

require 'fizz_buzz_component/commands/take_turn'

require 'fizz_buzz_component/messages/commands/take_turn'

require 'fizz_buzz_component/messages/events/turn_taken'
require 'fizz_buzz_component/messages/events/turn_rejected'
require 'fizz_buzz_component/messages/events/game_ended'

require 'fizz_buzz_component/projection'
