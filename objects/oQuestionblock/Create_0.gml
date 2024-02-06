event_inherited();

contents = conts.coin;

blocksprite = sprite_index
hitblockimage = 0;
emptyblockimage = 1;

arenarespawn = 0
if instance_exists(oIsArena)
{contents = choose(conts.coin,conts.powerup,conts.coin,conts.coin)}