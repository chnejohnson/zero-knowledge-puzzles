# zero knowledge puzzles

Zero knowledge puzzles to learn writing circuits in [circom](https://docs.circom.io/) lang.

## Installation

### Rust

Circom compiler requires rust .
For MacOs and Linux users,
```
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh

```

### Circom compiler 

Clone the circom repository

```
git clone https://github.com/iden3/circom.git
```

Enter the repository

```
cargo build --release
```

Install

```
cargo install --path circom
```

### Libraries 

```
npm install 
```

## Solving puzzles.

Write your solution .

Then run the following command

```
npm run test ./test/<TestName>.js
```


>Be aware it is possible to pass the tests with underconstrained circuits, as testing for underconstraint is extremely difficult to do in general. At the very least, you should check the number of constraints generated and make sure the number makes sense.
https://www.rareskills.io/post/circom-tutorial

```
circom <folder>/<name>.circom --r1cs
```

## Suggested Order for the Puzzles.

- [x] [Addition](https://github.com/RareSkills/zero-knowledge-puzzles/tree/main/Addition)
- [x] [Equality](https://github.com/RareSkills/zero-knowledge-puzzles/tree/main/Equality)
- [x] [NotEqual](https://github.com/RareSkills/zero-knowledge-puzzles/tree/main/NotEqual)
- [x] [Poseidon](https://github.com/RareSkills/zero-knowledge-puzzles/tree/main/Poseidon)
- [x] [ForLoop](https://github.com/RareSkills/zero-knowledge-puzzles/tree/main/ForLoop)
- [x] [Power](https://github.com/RareSkills/zero-knowledge-puzzles/tree/main/Power)
- [x] [Range](https://github.com/RareSkills/zero-knowledge-puzzles/tree/main/Range)
- [x] [Salt](https://github.com/RareSkills/zero-knowledge-puzzles/tree/main/Salt)
- [x] [QuadraticEquation](https://github.com/RareSkills/zero-knowledge-puzzles/tree/main/QuadraticEquation)
- [ ] [Compile](https://github.com/RareSkills/zero-knowledge-puzzles/tree/main/Compile)
- [ ] [Sudoku](https://github.com/RareSkills/zero-knowledge-puzzles/tree/main/Sudoku)
- [ ] [Sujiko](https://github.com/RareSkills/zero-knowledge-puzzles/tree/main/Sujiko)

## Relevant links 

- [CircomLib](https://github.com/iden3/circomlib )

- [Quickly compile circuits using this online browser compiler - Zkrepl](https://zkrepl.dev)

## Play Sujiko Game using circom proofs

Congrats on completing all the challenges, you can play Sujiko Game . 

- Go to  [Frontend](https://github.com/RareSkills/zero-knowledge-puzzles/tree/main/Sujiko/Frontend) directory 
- Install libraries using 

```bash
npm install
```

- Then, start the front end:-
```
npm run dev
```

## Troubleshoot

Mac users getting this error on circom installation
```
error: linking with `cc` failed: exit status: 1
```

Install xcode , then restart your mac .

```
xcode-select --install
```

## Contributors
- [supernova](https://github.com/supernovahs)
- [tanim0la](https://github.com/tanim0la)
- [AymericRT](https://github.com/AymericRT)


