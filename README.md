# CarDealership-Scripts

Car Dealership Tycoon cash farm script, protected build.

## Usage

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/fhuev12/CarDealership-Scripts/main/CarDealership_Farm_v1.lua"))()
```

Requirements: an executor that provides `game:HttpGet` and `loadstring` (bit32 is standard in Roblox Luau).

## Build

- source: `汽车经销大享(1)(1).lua` (2,759 bytes, 81 lines, SHA-256 `39c150d49592eb781aeb98736b6a25e3e4bb52219a412b337d7a84c5ea130f36`)
- pipeline: LZSS compress -> 4-byte length header -> XOR (28-char key) -> Base64 -> 2 shards
- compressed: 1,161 bytes (42.1%), base64 payload 1,556 chars, loader 3,288 bytes
- verified: shards pulled from raw.githubusercontent.com decode back to 2,759 bytes with an identical SHA-256

## Layout

```
CarDealership_Farm_v1.lua   loader
parts/CarDealership_Farm_v1.p1.txt ... p2.txt
```

The loader fetches all shards, strips whitespace, base64-decodes, XOR-decrypts, LZSS-decompresses, verifies the declared length, then runs the payload. Any missing or tampered shard, or a wrong key, aborts before execution.

## What the script does

Idle kick guard via VirtualUser, then loops tween-teleporting every BasePart of the player's car to race checkpoints, so the race finishes instantly and the cash reward is collected repeatedly. It toggles on the global `Farm` flag.

## Warning

This script acts client-side against a live Roblox game. It violates the Roblox Terms of Service and can get the account banned. Use only for your own private testing.
