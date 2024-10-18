/// @description Insert description here
// You can write your code in this editor
if !instance_exists(obj_player) exit;

var _camWidth = camera_get_view_width(view_camera[0]);
var _camHeight = camera_get_view_height(view_camera[0]);


//Get Camera target coords
var _camX = obj_player.x - _camWidth/2;
var _camY = obj_player.y - _camHeight/2;

_camX = clamp(_camX, 0, room_width - _camWidth);
_camY = clamp(_camY, 0, room_height - _camHeight);

//Set Cam Coords
finalCamX += (_camX - finalCamX) * camTrailSpd;
finalCamY += (_camY - finalCamY) * camTrailSpd;


//Set Camera Coords
camera_set_view_pos(view_camera[0], _camX, _camY);

