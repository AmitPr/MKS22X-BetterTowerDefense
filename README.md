# BetterTowerDefense (BTD) by No Clue
A Tower Defense game where the enemies can choose their own path from their start to your home base (That you need to defend). The player can build walls, and build defensive towers which also can act as walls to route the enemies in any strategy they wish. Different types of towers have different statistics, and special effects which can be used.
## How To Run
TODO
## Development Log
#### 5/17/19
Amit: Added most enemy variables and basic methods, as well as the same for world methods and variables.
Mario: Added most tower variables and basic methods such as fire and display.
#### 5/20/19
Amit & Mario: Added display and scaling methods, created some test towers and enemies. Fixed enemy display bug where they wouldn't display in the middle.
#### 5/21/19
Amit: Added Some basic structure for towers and enemies, added screenToWorld grid scaling functions, mouse click to add towers to the map.  
Amit & Mario: Added smooth enemy movement between tiles  
Mario: Started pathfinding but ran into bugs
#### 5/22/19
Amit: Fixed Mario's pathfinding issue by switching y and x values, then partially rewrote so that x mapped to x and y mapped to y again. Made a secondary algorithm in branch pathFinding-recursive that was used mostly for debugging.
Mario: Started working on different ballons generating.
#### 5/23/19
Amit: Started working on Bullet and Tower classes to allow for shooting balloons. Ran into some thinking problems concerning collision between bullets and balloons. Thinking about using the pixel buffer and checking for balloons.
Mario: Added different speeds and types of balloons. Found an issue where balloons with a "speed" of 3 (specifically) would pathfind correctly to the player's base but get stuck on the last tile...
#### 5/24/19
Amit: Implemented dart towers and their shooting, walls (basically towers with no fire), found an issue where balloons hit with bullets would start going in one direction forever. Tweaked balloons speeds as well.
#### 5/25/19  
Amit: Added Freeze Tower, started working on fixing some bugs with damage and balloons floating through the walls. Fixed the issue by changing the way balloons move a little bit. Added effects class to balloons so that they can be modified by towers (used by freeze to slow balloons)
