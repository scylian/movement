// Get Player Input
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

// Calculate Movement
var move = key_right - key_left;

if (abs(hsp) < walkspd) && (move != 0) {
	hsp = hsp + move * walkspd/8;
	if (move != xDirection) && (xDirection != 0) {
		hsp = hsp * -1;
	}
	
	xDirection = move;
} else if (abs(hsp) > 0) && (move == 0) {
	hsp = hsp - sign(hsp) * walkspd/4;
	
	move = xDirection;
} else {
	hsp = move * walkspd;
}


if (place_meeting(x,y+1,oWall)) && (key_jump) {
	vsp = -19;
	isJumping = true;
}

if (isJumping) && (keyboard_check_released(vk_space)) {
	vsp = 0;
	isJumping = false;
}

if (sign(vsp) == 1) {
	isJumping = false;
}

if (vsp < 20) {
	vsp = vsp + grv;
}

//if (isJumping) && (keyboard_check(vk_space)) {
//	//if (vsp > -15) {
//	//	vsp = vsp - 5;
//	//} else {
//	//	isJumping = false;
//	//}
	
//	// Check if player is falling
//	if (sign(vsp) == 1) {
//		isJumping = false;
//	}
//}

// Horizontal Collision
if (place_meeting(x+hsp,y,oWall)) {
	while (!place_meeting(x+sign(hsp),y,oWall)) {
		x = x + sign(hsp);
	}
	hsp = 0;
}

 x = x + hsp;

// Vertical Collision
if (place_meeting(x,y+vsp, oWall)) {
	while (!place_meeting(x,y+sign(vsp), oWall)) {
		y = y + sign(vsp);
	}
	vsp = 0;
}

y = y + vsp;