# Tic Tac Toe

A command-line Tic Tac Toe game for two human players.

## Run

```bash
ruby bin/tic_tac_toe
```

Players take turns choosing squares from `1` to `9`. The board is displayed between turns, and the game ends when a player wins or the board is full.

## Structure

- `bin/tic_tac_toe` starts the game.
- `lib/tic_tac_toe/board.rb` manages squares, board display, wins, and draws.
- `lib/tic_tac_toe/player.rb` stores each player's name and mark.
- `lib/tic_tac_toe/game.rb` runs the game loop and command-line prompts.
