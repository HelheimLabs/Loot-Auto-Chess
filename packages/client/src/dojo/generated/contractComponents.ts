/* Autogenerated file. Do not edit manually. */

import { defineComponent, Type as RecsType, World } from "@dojoengine/recs";

export type ContractComponents = Awaited<ReturnType<typeof defineContractComponents>>;

export function defineContractComponents(world: World) {
  return {
    Altar: (() => {
      return defineComponent(
        world,
        { player: RecsType.BigInt, slot1: RecsType.Number, slot2: RecsType.Number, slot3: RecsType.Number, slot4: RecsType.Number, slot5: RecsType.Number },
        {
          metadata: {
            name: "Altar",
            types: ["contractaddress","u8","u8","u8","u8","u8"],
            customTypes: [],
          },
        }
      );
    })(),
    CreatureProfile: (() => {
      return defineComponent(
        world,
        { creature_index: RecsType.Number, level: RecsType.Number, rarity: RecsType.Number, health: RecsType.Number, attack: RecsType.Number, armor: RecsType.Number, range: RecsType.Number, speed: RecsType.Number, initiative: RecsType.Number },
        {
          metadata: {
            name: "CreatureProfile",
            types: ["u8","u8","u8","u16","u8","u8","u8","u8","u8"],
            customTypes: [],
          },
        }
      );
    })(),
    GlobalState: (() => {
      return defineComponent(
        world,
        { index: RecsType.Number, totalMatch: RecsType.Number, totalCreature: RecsType.Number, totalPieceCounter: RecsType.Number },
        {
          metadata: {
            name: "GlobalState",
            types: ["u32","u32","u8","u32"],
            customTypes: [],
          },
        }
      );
    })(),
    InningBattle: (() => {
      return defineComponent(
        world,
        { currentMatch: RecsType.Number, round: RecsType.Number, homePlayer: RecsType.BigInt, awayPlayer: RecsType.BigInt, end: RecsType.Boolean },
        {
          metadata: {
            name: "InningBattle",
            types: ["u32","u8","contractaddress","contractaddress","bool"],
            customTypes: [],
          },
        }
      );
    })(),
    MatchState: (() => {
      return defineComponent(
        world,
        { index: RecsType.Number, round: RecsType.Number },
        {
          metadata: {
            name: "MatchState",
            types: ["u32","u8"],
            customTypes: [],
          },
        }
      );
    })(),
    Piece: (() => {
      return defineComponent(
        world,
        { gid: RecsType.Number, owner: RecsType.BigInt, idx: RecsType.Number, slot: RecsType.Number, level: RecsType.Number, creature_index: RecsType.Number, x: RecsType.Number, y: RecsType.Number },
        {
          metadata: {
            name: "Piece",
            types: ["u32","contractaddress","u8","u8","u8","u8","u8","u8"],
            customTypes: [],
          },
        }
      );
    })(),
    Player: (() => {
      return defineComponent(
        world,
        { player: RecsType.BigInt, inMatch: RecsType.Number, health: RecsType.Number, streakCount: RecsType.Number, coin: RecsType.Number, level: RecsType.Number, locked: RecsType.Number, heroesCount: RecsType.Number, inventoryCount: RecsType.Number },
        {
          metadata: {
            name: "Player",
            types: ["contractaddress","u32","u8","u8","u8","u8","u8","u8","u8"],
            customTypes: [],
          },
        }
      );
    })(),
    PlayerInvPiece: (() => {
      return defineComponent(
        world,
        { owner: RecsType.BigInt, slot: RecsType.Number, gid: RecsType.Number },
        {
          metadata: {
            name: "PlayerInvPiece",
            types: ["contractaddress","u8","u32"],
            customTypes: [],
          },
        }
      );
    })(),
    PlayerPiece: (() => {
      return defineComponent(
        world,
        { owner: RecsType.BigInt, idx: RecsType.Number, gid: RecsType.Number },
        {
          metadata: {
            name: "PlayerPiece",
            types: ["contractaddress","u8","u32"],
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
    StageProfile: (() => {
      return defineComponent(
        world,
        { stage: RecsType.Number, pieceCount: RecsType.Number },
        {
          metadata: {
            name: "StageProfile",
            types: ["u8","u8"],
            customTypes: [],
          },
        }
      );
    })(),
    StageProfilePiece: (() => {
      return defineComponent(
        world,
        { stage: RecsType.Number, index: RecsType.Number, x: RecsType.Number, y: RecsType.Number, creature_index: RecsType.Number, level: RecsType.Number },
        {
          metadata: {
            name: "StageProfilePiece",
            types: ["u8","u8","u8","u8","u8","u8"],
            customTypes: [],
          },
        }
      );
    })(),
  };
}
