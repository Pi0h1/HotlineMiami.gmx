global.grid=mp_grid_create(0,0,room_width/16,room_height/16,16,16)
mp_grid_add_instances(global.grid,objWallBrickH,1)
mp_grid_add_instances(global.grid,objWallBrickV,1)
mp_grid_add_instances(global.grid,objWallHospitalH,1)
mp_grid_add_instances(global.grid,objWallHospitalV,1)
mp_grid_add_instances(global.grid,objWallHeavyH,1)
mp_grid_add_instances(global.grid,objWallHeavyV,1)
mp_grid_add_instances(global.grid,objWallSoftH,1)
mp_grid_add_instances(global.grid,objWallSoftV,1)
mp_grid_add_instances(global.grid,objEuroPodV,1)
mp_grid_add_instances(global.grid,objEuroPodH,1)
mp_grid_add_instances(global.grid,objEuroPillar,1)
mp_grid_add_instances(global.grid,objTruck,1)
mp_grid_add_instances(global.grid,objWindowH,1)
mp_grid_add_instances(global.grid,objWindowV,1)
mp_grid_add_instances(global.grid,objFurniture,1)
mp_grid_add_instances(global.grid,objHighballCurtain,1)
mp_grid_add_instances(global.grid,objGlassPanelH,1)
mp_grid_add_instances(global.grid,objGlassPanelV,1)

with objDoorV {
if solid=1 mp_grid_add_instances(global.grid,id,1)
}
with objDoorV2 {
if solid=1 mp_grid_add_instances(global.grid,id,1)
}
with objDoorH {
if solid=1 mp_grid_add_instances(global.grid,id,1)
}
with objDoorH2 {
if solid=1 mp_grid_add_instances(global.grid,id,1)
}

//show_message("Path Initialized")
