use starknet::ContractAddress;


#[derive(Model, Drop, Serde)]
struct Player {
    #[key]
    player: ContractAddress,
    health: u8,
    streakCount: u8,
    coin: u8,
    tier: u8,
    locked: u8,
    // dojo does not support array for now
    heroesCount: u8,
    heroAltarCount: u8,
    inventoryCount: u8,
}

#[derive(Model, Drop, Serde)]
struct Creature {
    #[key]
    tier: u8,
    #[key]
    rarity: u8,
    #[key]
    internal_index: u8,
    health: u16,
    attack: u8,
    range: u8,
    defense: u8,
    speed: u16,
    movement: u8,
}

#[derive(Model, Drop, Serde)]
struct Piece {
    #[key]
    owner: ContractAddress,
    #[key]
    index: u8,
    tier: u8,
    rarity: u8,
    internal_index: u8,
    x_board: u8,
    y_board: u8,
    x_in_battle: u8,
    y_in_battle: u8,
    currentHealth: u16
}

#[derive(Model, Drop, Serde)]
struct InningBattle {
    #[key]
    index: u32,
    homePlayer: ContractAddress,
    awayPlayer: ContractAddress
}


#[derive(Serde, Copy, Drop, Introspect)]
enum Direction {
    None,
    Left,
    Right,
    Up,
    Down,
}

impl DirectionIntoFelt252 of Into<Direction, felt252> {
    fn into(self: Direction) -> felt252 {
        match self {
            Direction::None => 0,
            Direction::Left => 1,
            Direction::Right => 2,
            Direction::Up => 3,
            Direction::Down => 4,
        }
    }
}

#[derive(Model, Drop, Serde)]
struct Moves {
    #[key]
    player: ContractAddress,
    remaining: u8,
    last_direction: Direction
}

#[derive(Copy, Drop, Serde, Introspect)]
struct Vec2 {
    x: u32,
    y: u32
}

#[derive(Model, Copy, Drop, Serde)]
struct Position {
    #[key]
    player: ContractAddress,
    vec: Vec2,
}

trait Vec2Trait {
    fn is_zero(self: Vec2) -> bool;
    fn is_equal(self: Vec2, b: Vec2) -> bool;
}

impl Vec2Impl of Vec2Trait {
    fn is_zero(self: Vec2) -> bool {
        if self.x - self.y == 0 {
            return true;
        }
        false
    }

    fn is_equal(self: Vec2, b: Vec2) -> bool {
        self.x == b.x && self.y == b.y
    }
}

#[cfg(test)]
mod tests {
    use super::{Position, Vec2, Vec2Trait};

    #[test]
    #[available_gas(100000)]
    fn test_vec_is_zero() {
        assert(Vec2Trait::is_zero(Vec2 { x: 0, y: 0 }), 'not zero');
    }

    #[test]
    #[available_gas(100000)]
    fn test_vec_is_equal() {
        let position = Vec2 { x: 420, y: 0 };
        assert(position.is_equal(Vec2 { x: 420, y: 0 }), 'not equal');
    }
}
