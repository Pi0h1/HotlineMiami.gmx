var i,medianx,mediany;
i=0
medianx=0
mediany=0
repeat global.kills {
medianx+=global.killx[i]
mediany+=global.killy[i]
i+=1
}
medianx/=global.kills
mediany/=global.kills
i=0
repeat (global.kills) {
global.mobilityscore+=floor(point_distance(medianx,mediany, global.killx[i], global.killy[i]))*2
i+=1
}
