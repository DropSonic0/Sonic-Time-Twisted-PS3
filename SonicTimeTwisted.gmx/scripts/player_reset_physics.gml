// player_reset_physics()
// bounding box
offset_x = 8;
offset_y = 14-(character_id==2);
offset_wall = 10;
segment_width = offset_x*0.5;
segment_height = offset_y*0.5;
// speed values
speed_cap = 6;
acceleration = 0.09375; // Doubled for 30 FPS
deceleration = 1.0; // Doubled for 30 FPS
ground_friction = 0.09375; // Doubled for 30 FPS
air_acceleration = 0.1875; // Doubled for 30 FPS
roll_deceleration = 0.25; // Doubled for 30 FPS
roll_friction = 0.046875; // Doubled for 30 FPS
// gravity values
jump_constant = (character_id==3 ? 11.0 : 13.0); // Original: (K:5.5, S/T:6.5) Doubled for 30 FPS
jump_release = 4;
gravity_force = 0.4375; // Doubled for 30 FPS
hit_force = 0.375; // Doubled for 30 FPS
// character-specific values
switch character_id
{
case 3: // knuckles
    glide_acceleration = 0.03125; // Doubled for 30 FPS
    climb_speed = 2; // Doubled for 30 FPS
    break;
}
// superspeed modification
if superspeed
{
    // speed values
    speed_cap *= 2;
    acceleration *= 2;
    ground_friction *= 2;
    air_acceleration *= 2;
    roll_friction *= 2;
}
// superform modification
if superform
{
    // check character
    switch character_id
    {
    case 1: // sonic
        speed_cap += 4;
        acceleration *= 4;
        deceleration *= 2;
        air_acceleration *= 4;
        jump_constant = 8;
        break;
    case 3: // knuckles
        glide_acceleration *= 2;
        climb_speed *= 2;
    default: // everyone else
        speed_cap += 2;
        acceleration *= 2;
        deceleration *= 1.5;
        air_acceleration *= 2;
    }
}
// underwater modification
if underwater
{
    // speed values
    speed_cap *= 0.5;
    acceleration *= 0.5;
    deceleration *= 0.5;
    air_acceleration *= 0.5;
    if not superform {ground_friction *= 0.5; roll_friction *= 0.5;}
    // gravity values
    jump_constant = 3.5-(0.5*(character_id==3));
    jump_release *= 0.5;
    gravity_force = 0.0625;
    hit_force = 0.0625;
    
    jump_action = true;
}
