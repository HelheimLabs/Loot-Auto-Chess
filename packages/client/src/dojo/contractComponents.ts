/* Autogenerated file. Do not edit manually. */

import { defineComponent, Type as RecsType, World } from "@dojoengine/recs";

export function defineContractComponents(world: World) {
  return {
	  Creature: (() => {
	    return defineComponent(
	      world,
	      { tier: RecsType.Number, rarity: RecsType.Number, internal_index: RecsType.Number, health: RecsType.Number, attack: RecsType.Number, range: RecsType.Number, defense: RecsType.Number, speed: RecsType.Number, movement: RecsType.Number },
	      {
	        metadata: {
	          name: "Creature",
	          types: ["u8","u8","u8","u16","u8","u8","u8","u16","u8"],
	          customTypes: [],
	        },
	      }
	    );
	  })(),
	  InningBattle: (() => {
	    return defineComponent(
	      world,
	      { index: RecsType.Number, homePlayer: RecsType.BigInt, awayPlayer: RecsType.BigInt },
	      {
	        metadata: {
	          name: "InningBattle",
	          types: ["u32","contractaddress","contractaddress"],
	          customTypes: [],
	        },
	      }
	    );
	  })(),
	  Moves: (() => {
	    return defineComponent(
	      world,
	      { player: RecsType.BigInt, remaining: RecsType.Number, last_direction: RecsType.Number },
	      {
	        metadata: {
	          name: "Moves",
	          types: ["contractaddress","u8","enum"],
	          customTypes: ["Direction"],
	        },
	      }
	    );
	  })(),
	  Piece: (() => {
	    return defineComponent(
	      world,
	      { owner: RecsType.BigInt, index: RecsType.Number, tier: RecsType.Number, rarity: RecsType.Number, internal_index: RecsType.Number, x_board: RecsType.Number, y_board: RecsType.Number, x_in_battle: RecsType.Number, y_in_battle: RecsType.Number, currentHealth: RecsType.Number },
	      {
	        metadata: {
	          name: "Piece",
	          types: ["contractaddress","u8","u8","u8","u8","u8","u8","u8","u8","u16"],
	          customTypes: [],
	        },
	      }
	    );
	  })(),
	  Player: (() => {
	    return defineComponent(
	      world,
	      { player: RecsType.BigInt, health: RecsType.Number, streakCount: RecsType.Number, coin: RecsType.Number, tier: RecsType.Number, locked: RecsType.Number, heroesCount: RecsType.Number, heroAltarCount: RecsType.Number, inventoryCount: RecsType.Number },
	      {
	        metadata: {
	          name: "Player",
	          types: ["contractaddress","u8","u8","u8","u8","u8","u8","u8","u8"],
	          customTypes: [],
	        },
	      }
	    );
	  })(),
	  Position: (() => {
	    return defineComponent(
	      world,
	      { player: RecsType.BigInt, vec: { x: RecsType.Number, y: RecsType.Number } },
	      {
	        metadata: {
	          name: "Position",
	          types: ["contractaddress","u32","u32"],
	          customTypes: ["Vec2"],
	        },
	      }
	    );
	  })(),
  };
}
