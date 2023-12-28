use autochessia::models::{Direction, Creature, InningBattle};

// define the interface
#[starknet::interface]
trait IActions<TContractState> {
    fn spawn(self: @TContractState);
    // fn startBattle(self: @TContractState);
}

// dojo decorator
#[dojo::contract]
mod home {
    use starknet::{ContractAddress, get_caller_address};
    use autochessia::models::{Creature, Position, Piece, Player, Moves, Direction, Vec2};
    use autochessia::utils::next_position;
    use super::IActions;

    // declaring custom event struct
    #[event]
    #[derive(Drop, starknet::Event)]
    enum Event {
        Moved: Moved,
    }

    // declaring custom event struct
    #[derive(Drop, starknet::Event)]
    struct Moved {
        player: ContractAddress,
        direction: Direction
    }

    // impl: implement functions specified in trait
    #[external(v0)]
    impl HomeImpl of IActions<ContractState> {
        // ContractState is defined by system decorator expansion
        fn spawn(self: @ContractState) {
            // Access the world dispatcher for reading.
            let world = self.world_dispatcher.read();

            // initialize creature, these can be moved to other place later
            set!(
                world,
                (Creature {
                    tier: 1,
                    rarity: 1,
                    internal_index: 1,
                    health: 600,
                    attack: 50,
                    defense: 5,
                    range: 1,
                    speed: 101,
                    movement: 4
                })
            );

            // Get the address of the current caller, possibly the player's address.
            let player = get_caller_address();

            // spawn player
            set!(
                world,
                (
                    Player {
                        player,
                        health: 30,
                        heroesCount: 1,
                        inventoryCount: 0,
                        heroAltarCount: 0,
                        tier: 1,
                        coin: 0,
                        streakCount: 0,
                        locked: 0
                    },
                    Piece {
                        owner: player,
                        index: 1,
                        tier: 1,
                        rarity: 1,
                        internal_index: 1,
                        x_board: 1,
                        y_board: 1,
                        x_in_battle: 0,
                        y_in_battle: 0,
                        currentHealth: 600
                    }
                )
            );

            // spawn player's
            // set!(world, (InningBattle { index: 1, health: 30, heroesCount: 1 }),);

            // spawn player's enemy

            // create battle
            // set!(
            //     world,
            //     (Player { player, health: 30, heroesCount: 1 }),
            //     Piece {
            //         owner: player,
            //         index: 1,
            //         tier: 1,
            //         rarity: 1,
            //         internal_index: 1,
            //         x_board: 1,
            //         y_board: 1,
            //         currentHealth: 600
            //     }
            // );

            // Retrieve the player's current position from the world.
            let position = get!(world, player, (Position));

            // Retrieve the player's move data, e.g., how many moves they have left.
            let moves = get!(world, player, (Moves));

            // Update the world state with the new data.
            // 1. Set players moves to 10
            // 2. Move the player's position 100 units in both the x and y direction.
            set!(
                world,
                (
                    Moves { player, remaining: 100, last_direction: Direction::None },
                    Position { player, vec: Vec2 { x: 10, y: 10 } },
                )
            );
        }
    }
}

#[cfg(test)]
mod tests {
    use starknet::class_hash::Felt252TryIntoClassHash;

    // import world dispatcher
    use dojo::world::{IWorldDispatcher, IWorldDispatcherTrait};

    // import test utils
    use dojo::test_utils::{spawn_test_world, deploy_contract};

    // import models
    use autochessia::models::{position, moves};
    use autochessia::models::{Position, Moves, Direction, Vec2};

    // import actions
    use super::{actions, IActionsDispatcher, IActionsDispatcherTrait};

    #[test]
    #[available_gas(30000000)]
    fn test_move() {
        // caller
        let caller = starknet::contract_address_const::<0x0>();

        // models
        let mut models = array![position::TEST_CLASS_HASH, moves::TEST_CLASS_HASH];

        // deploy world with models
        let world = spawn_test_world(models);

        // deploy systems contract
        let contract_address = world
            .deploy_contract('salt', actions::TEST_CLASS_HASH.try_into().unwrap());
        let actions_system = IActionsDispatcher { contract_address };

        // call spawn()
        actions_system.spawn();

        // call move with direction right
        actions_system.move(Direction::Right);

        // Check world state
        let moves = get!(world, caller, Moves);

        // casting right direction
        let right_dir_felt: felt252 = Direction::Right.into();

        // check moves
        assert(moves.remaining == 99, 'moves is wrong');

        // check last direction
        assert(moves.last_direction.into() == right_dir_felt, 'last direction is wrong');

        // get new_position
        let new_position = get!(world, caller, Position);

        // check new position x
        assert(new_position.vec.x == 11, 'position x is wrong');

        // check new position y
        assert(new_position.vec.y == 10, 'position y is wrong');
    }
}