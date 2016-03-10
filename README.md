# Tournament-Scripts
A set of work-in-progress shell scripts for small tournament organization tasks.

I plan on using this repository to share small shell scripts dedicated to menial tournament-related tasks.  A lot of what goes in here is or will be shell versions of tasks in the Tournament Tracker ( https://github.com/steelfire81/TournamentTracker ).  These scripts are mostly just things to do when I get bored, so this repository will likely not be updated often.

ABOUT THE SCRIPTS:
poolmaker.sh
Usage: poolmaker.sh [PLAYERS PER POOL] [PLAYER 1] [PLAYER 2] ... [PLAYER N]
The poolmaker script takes a list of players in seed order and makes balanced pools with a specified number of players per pool.  The balancing system snakes through the list of players (from front to back, then back to front, then front to back, etc.) and places each player in a pool one at a time.
