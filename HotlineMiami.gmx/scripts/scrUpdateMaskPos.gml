var check;
check=0


if argument0=sprPPipeKill or argument0=sprPKillCrowbar or argument0=sprPTrophyKill or argument0=sprPClubKill or argument0=sprPBatKill or argument0=sprPPoolKill or argument0=sprPKillPan or argument0=sprPKillPot or argument0=sprPAxeKill{
maskaddx[0]=0 maskaddy[0]=0
maskaddx[1]=0 maskaddy[1]=0
maskaddx[2]=0 maskaddy[2]=0
maskaddx[3]=0 maskaddy[3]=0
maskaddx[4]=0 maskaddy[4]=0
maskaddx[5]=1 maskaddy[5]=0
maskaddx[6]=1 maskaddy[6]=0
maskaddx[7]=1 maskaddy[7]=0
maskaddx[8]=1 maskaddy[8]=0
check=1
}

if argument0=sprPClimbWindow {
i=0
repeat (9) {
maskaddx[i]=0 maskaddy[i]=0
i+=1
}
maskaddx[9]=2 maskaddy[9]=0
maskaddx[10]=4 maskaddy[10]=0
maskaddx[11]=7 maskaddy[11]=0
maskaddx[12]=7 maskaddy[12]=0
maskaddx[13]=9 maskaddy[13]=0
maskaddx[14]=9 maskaddy[14]=0
maskaddx[15]=11 maskaddy[15]=0
maskaddx[16]=12 maskaddy[16]=0
maskaddx[17]=20 maskaddy[17]=0
maskaddx[18]=20 maskaddy[18]=0
maskaddx[19]=19 maskaddy[19]=0
maskaddx[20]=19 maskaddy[20]=0
check=1
}


if argument0=sprClubOwnerDie {
i=0
repeat (84) {
maskaddx[i]=10 maskaddy[i]=0
i+=1
}
maskaddy[3]=1
maskaddy[4]=1
maskaddy[8]=-1
maskaddy[9]=-1
maskaddy[13]=1
maskaddy[14]=1
maskaddy[18]=-1
maskaddy[19]=-1
maskaddy[23]=1
maskaddy[24]=1
maskaddy[28]=-1
maskaddy[29]=-1
maskaddy[33]=1
maskaddy[34]=1
maskaddy[38]=-1
maskaddy[39]=-1
maskaddx[47]=12 
maskaddx[54]=12 
maskaddx[61]=12 
maskaddx[74]=12 
check=1
}



if argument0=sprPWalkLedge {
maskaddx[0]=19 maskaddy[0]=0
maskaddx[1]=19 maskaddy[1]=-1
maskaddx[2]=19 maskaddy[2]=-1
maskaddx[3]=19 maskaddy[3]=-2
maskaddx[4]=19 maskaddy[4]=-3
maskaddx[5]=19 maskaddy[5]=-3
maskaddx[6]=19 maskaddy[6]=-3
check=1
}

if argument0=sprPlayerClimbDown {
maskaddx[0]=0 maskaddy[0]=0
maskaddx[1]=-3 maskaddy[1]=-1
maskaddx[2]=-1 maskaddy[2]=-1
maskaddx[3]=0 maskaddy[3]=-1
maskaddx[4]=2 maskaddy[4]=-1
maskaddx[5]=3 maskaddy[5]=-1
maskaddx[6]=1 maskaddy[6]=-1
maskaddx[7]=-3 maskaddy[7]=-1
maskaddx[8]=-3 maskaddy[8]=-1
check=1
}

if argument0=sprPlayerClimbUp {
maskaddx[0]=0 maskaddy[0]=0
maskaddx[1]=-1 maskaddy[1]=0
maskaddx[2]=0 maskaddy[2]=0
maskaddx[3]=1 maskaddy[3]=0
maskaddx[4]=-2 maskaddy[4]=0
maskaddx[5]=-2 maskaddy[5]=0
check=1
}




if argument0=sprPClimbLedge {
maskaddx[0]=19 maskaddy[0]=0
maskaddx[1]=19 maskaddy[1]=0
maskaddx[2]=23 maskaddy[2]=3
maskaddx[3]=26 maskaddy[3]=9
maskaddx[4]=26 maskaddy[4]=9
maskaddx[5]=26 maskaddy[5]=10
maskaddx[6]=26 maskaddy[6]=14
maskaddx[7]=26 maskaddy[7]=14
maskaddx[8]=26 maskaddy[8]=26
maskaddx[9]=26 maskaddy[9]=26
maskaddx[10]=26 maskaddy[10]=29
maskaddx[11]=26 maskaddy[11]=34
maskaddx[12]=26 maskaddy[12]=34
maskaddx[13]=26 maskaddy[13]=34
check=1
}


if argument0=sprPStrangleAssassin {
i=0
repeat (8) {
maskaddx[i]=8 maskaddy[i]=0
i+=1
}
repeat (38) {
maskaddx[i]=9 maskaddy[i]=0
i+=1
}
repeat (6) {
maskaddx[i]=8 maskaddy[i]=0
i+=1
}
check=1
}

if argument0=sprPKillSledgeHammer {
maskaddx[0]=-3 maskaddy[0]=0
maskaddx[1]=-4 maskaddy[1]=0
maskaddx[2]=-4 maskaddy[2]=0
maskaddx[3]=-4 maskaddy[3]=0
maskaddx[4]=-4 maskaddy[4]=0
maskaddx[5]=-3 maskaddy[5]=0
maskaddx[6]=-3 maskaddy[6]=0
maskaddx[7]=-3 maskaddy[7]=0
maskaddx[8]=-3 maskaddy[8]=0
maskaddx[9]=-3 maskaddy[9]=0
maskaddx[10]=-3 maskaddy[10]=0
check=1
}


if argument0=sprPKillMachete {
maskaddx[0]=0 maskaddy[0]=0
maskaddx[1]=0 maskaddy[1]=1
maskaddx[2]=0 maskaddy[2]=1
maskaddx[3]=0 maskaddy[3]=1
maskaddx[4]=0 maskaddy[4]=0
maskaddx[5]=0 maskaddy[5]=0
maskaddx[6]=0 maskaddy[6]=0
maskaddx[7]=0 maskaddy[7]=0
maskaddx[8]=0 maskaddy[8]=1
maskaddx[9]=0 maskaddy[9]=1
maskaddx[10]=0 maskaddy[10]=1
maskaddx[11]=0 maskaddy[11]=0
maskaddx[12]=0 maskaddy[12]=0
maskaddx[13]=0 maskaddy[13]=0
maskaddx[14]=0 maskaddy[14]=0
maskaddx[15]=0 maskaddy[15]=1
maskaddx[16]=0 maskaddy[16]=1
maskaddx[17]=0 maskaddy[17]=1
maskaddx[18]=0 maskaddy[18]=1
maskaddx[19]=0 maskaddy[19]=0
maskaddx[20]=0 maskaddy[20]=0
maskaddx[21]=0 maskaddy[21]=0
maskaddx[22]=0 maskaddy[22]=0
check=1
}

if argument0=sprBodyguardFinish1 {
maskaddx[0]=8 maskaddy[0]=0
maskaddx[1]=7 maskaddy[1]=0
maskaddx[2]=6 maskaddy[2]=0
maskaddx[3]=6 maskaddy[3]=0
maskaddx[4]=8 maskaddy[4]=0
maskaddx[5]=7 maskaddy[5]=0
maskaddx[6]=6 maskaddy[6]=0
maskaddx[7]=6 maskaddy[7]=0
maskaddx[8]=8 maskaddy[8]=0
maskaddx[9]=7 maskaddy[9]=0
maskaddx[10]=6 maskaddy[10]=0
maskaddx[11]=6 maskaddy[11]=-1
maskaddx[12]=6 maskaddy[12]=0
maskaddx[13]=6 maskaddy[13]=1
maskaddx[14]=6 maskaddy[14]=0
maskaddx[15]=6 maskaddy[15]=0
maskaddx[16]=6 maskaddy[16]=-1
maskaddx[17]=6 maskaddy[17]=0
maskaddx[18]=6 maskaddy[18]=1
maskaddx[19]=6 maskaddy[19]=0
maskaddx[20]=6 maskaddy[20]=0
maskaddx[21]=8 maskaddy[21]=0
maskaddx[22]=7 maskaddy[22]=0
maskaddx[23]=6 maskaddy[23]=0
maskaddx[24]=6 maskaddy[24]=0
maskaddx[25]=8 maskaddy[25]=0
maskaddx[26]=7 maskaddy[26]=0
maskaddx[27]=6 maskaddy[27]=0
maskaddx[28]=6 maskaddy[28]=0
maskaddx[29]=6 maskaddy[29]=0
maskaddx[30]=6 maskaddy[30]=0
maskaddx[31]=6 maskaddy[31]=0
maskaddx[32]=6 maskaddy[32]=0
maskaddx[33]=6 maskaddy[33]=0
maskaddx[34]=6 maskaddy[34]=0
check=1
}


if argument0=sprPKillBottle {
maskaddx[0]=7 maskaddy[0]=0
maskaddx[1]=7 maskaddy[1]=0
maskaddx[2]=7 maskaddy[2]=0
maskaddx[3]=7 maskaddy[3]=0
maskaddx[4]=7 maskaddy[4]=0
maskaddx[5]=7 maskaddy[5]=0
maskaddx[6]=7 maskaddy[6]=0
maskaddx[7]=7 maskaddy[7]=0
maskaddx[8]=8 maskaddy[8]=0
maskaddx[9]=8 maskaddy[9]=1
maskaddx[10]=8 maskaddy[10]=1
maskaddx[11]=8 maskaddy[11]=0
maskaddx[12]=7 maskaddy[12]=0
maskaddx[13]=8 maskaddy[13]=0
maskaddx[14]=8 maskaddy[14]=1
maskaddx[15]=8 maskaddy[15]=1
maskaddx[16]=8 maskaddy[16]=0
maskaddx[17]=7 maskaddy[17]=0
maskaddx[18]=7 maskaddy[18]=0
check=1
}

if argument0=sprPKillBoilingPot {
maskaddx[0]=12 maskaddy[0]=0
i=1
repeat (13) {
maskaddx[i]=12 maskaddy[i]=-2
i+=1
}
check=1
}

if argument0=sprPKillHammer {
i=0
repeat (15) {
maskaddx[i]=7 maskaddy[i]=0
i+=1
}
i=10
repeat (2) {
maskaddx[i]=6 maskaddy[i]=0
i+=1
}
check=1
}

if argument0=sprPKillDart {
i=0
repeat (20) {
maskaddx[i]=0 maskaddy[i]=0
i+=1
}
check=1
}

if argument0=sprPKillDrill {
i=0
repeat (19) {
maskaddx[i]=9 maskaddy[i]=0
i+=1
}
i=3
repeat (7) {
maskaddx[i]=9 maskaddy[i]=-1
i+=2
}
check=1
}

if argument0=sprBoss1Finish {
maskaddx[0]=12 maskaddy[0]=0
maskaddx[1]=13 maskaddy[1]=0
maskaddx[2]=15 maskaddy[2]=0
maskaddx[3]=15 maskaddy[3]=0
maskaddx[4]=15 maskaddy[4]=0
maskaddx[5]=15 maskaddy[5]=0
maskaddx[6]=15 maskaddy[6]=0
maskaddx[7]=15 maskaddy[7]=0
maskaddx[8]=15 maskaddy[8]=0
maskaddx[9]=15 maskaddy[9]=0
maskaddx[10]=15 maskaddy[10]=0
maskaddx[11]=15 maskaddy[11]=0
maskaddx[12]=15 maskaddy[12]=0
maskaddx[13]=16 maskaddy[13]=0
maskaddx[14]=16 maskaddy[14]=0
maskaddx[15]=16 maskaddy[15]=0
maskaddx[16]=16 maskaddy[16]=0
maskaddx[17]=15 maskaddy[17]=0
maskaddx[18]=15 maskaddy[18]=0
maskaddx[19]=15 maskaddy[19]=0
maskaddx[20]=15 maskaddy[20]=0
maskaddx[21]=15 maskaddy[21]=0
maskaddx[22]=15 maskaddy[22]=0
maskaddx[23]=15 maskaddy[23]=0
maskaddx[24]=15 maskaddy[24]=0
maskaddx[25]=15 maskaddy[25]=0
maskaddx[26]=15 maskaddy[26]=0
maskaddx[27]=15 maskaddy[27]=0
maskaddx[28]=15 maskaddy[28]=0
maskaddx[29]=13 maskaddy[29]=0
check=1
}


if argument0=sprPClubBoss2 {
maskaddx[0]=0 maskaddy[0]=0
maskaddx[1]=0 maskaddy[1]=0
maskaddx[2]=0 maskaddy[2]=0
maskaddx[3]=0 maskaddy[3]=-2
maskaddx[4]=0 maskaddy[4]=-2
maskaddx[5]=0 maskaddy[5]=-2
maskaddx[6]=0 maskaddy[6]=-2
maskaddx[7]=0 maskaddy[7]=-2
maskaddx[8]=0 maskaddy[8]=-2
maskaddx[9]=0 maskaddy[9]=-2
maskaddx[10]=0 maskaddy[10]=-2
maskaddx[11]=0 maskaddy[11]=2
maskaddx[12]=0 maskaddy[12]=2
maskaddx[13]=0 maskaddy[13]=2
maskaddx[14]=0 maskaddy[14]=2
maskaddx[15]=0 maskaddy[15]=2
maskaddx[16]=0 maskaddy[16]=2
maskaddx[17]=0 maskaddy[17]=2
maskaddx[18]=0 maskaddy[18]=2
maskaddx[19]=0 maskaddy[19]=2
check=1
}

if argument0=sprPBrokenPoolKill {
maskaddx[0]=-3 maskaddy[0]=0
maskaddx[1]=-3 maskaddy[1]=0
maskaddx[2]=-3 maskaddy[2]=0
maskaddx[3]=-3 maskaddy[3]=0
maskaddx[4]=-3 maskaddy[4]=0
maskaddx[5]=-3 maskaddy[5]=0
maskaddx[6]=-3 maskaddy[6]=0
maskaddx[7]=-3 maskaddy[7]=0
maskaddx[8]=-3 maskaddy[8]=0
maskaddx[9]=-2 maskaddy[9]=0
maskaddx[10]=-2 maskaddy[10]=0
maskaddx[11]=-2 maskaddy[11]=0
maskaddx[12]=-1 maskaddy[12]=0
maskaddx[13]=-1 maskaddy[13]=0
maskaddx[14]=-1 maskaddy[14]=0
maskaddx[15]=-1 maskaddy[15]=0
maskaddx[16]=0 maskaddy[16]=0
maskaddx[17]=0 maskaddy[17]=0
maskaddx[18]=0 maskaddy[18]=0
maskaddx[19]=0 maskaddy[19]=0
check=1
}

if argument0=sprPKnifeKill {
maskaddx[0]=8 maskaddy[0]=1
maskaddx[1]=8 maskaddy[1]=1
maskaddx[2]=8 maskaddy[2]=1
maskaddx[3]=8 maskaddy[3]=0
maskaddx[4]=7 maskaddy[4]=0
maskaddx[5]=7 maskaddy[5]=0
maskaddx[6]=7 maskaddy[6]=0
maskaddx[7]=7 maskaddy[7]=0
maskaddx[8]=7 maskaddy[8]=0
check=1
}

if argument0=sprPSwordKill {
maskaddx[0]=0 maskaddy[0]=0
maskaddx[1]=0 maskaddy[1]=0
maskaddx[2]=0 maskaddy[2]=0
maskaddx[3]=0 maskaddy[3]=0
maskaddx[4]=0 maskaddy[4]=0
maskaddx[5]=0 maskaddy[5]=0
maskaddx[6]=0 maskaddy[6]=0
maskaddx[7]=0 maskaddy[7]=0
maskaddx[8]=-2 maskaddy[8]=0
maskaddx[9]=-4 maskaddy[9]=0
maskaddx[10]=-4 maskaddy[10]=0
maskaddx[11]=-2 maskaddy[11]=0
maskaddx[12]=0 maskaddy[12]=0
maskaddx[13]=-2 maskaddy[13]=0
maskaddx[14]=-4 maskaddy[14]=0
maskaddx[15]=-2 maskaddy[15]=0
check=1
}

if argument0=sprPScissorKill {
maskaddx[0]=7 maskaddy[0]=0
maskaddx[1]=8 maskaddy[1]=0
maskaddx[2]=8 maskaddy[2]=1
maskaddx[3]=8 maskaddy[3]=1
maskaddx[4]=8 maskaddy[4]=0
maskaddx[5]=7 maskaddy[5]=0
maskaddx[6]=8 maskaddy[6]=0
maskaddx[7]=8 maskaddy[7]=1
maskaddx[8]=8 maskaddy[8]=1
maskaddx[9]=8 maskaddy[9]=0
maskaddx[10]=7 maskaddy[10]=0
maskaddx[11]=7 maskaddy[11]=0
check=1
}

if argument0=sprPAttackThroat {
maskaddx[0]=-6 maskaddy[0]=0
maskaddx[1]=-6 maskaddy[1]=0
maskaddx[2]=-6 maskaddy[2]=0
maskaddx[3]=-6 maskaddy[3]=0
maskaddx[4]=-6 maskaddy[4]=0
maskaddx[5]=-6 maskaddy[5]=0
maskaddx[6]=-6 maskaddy[6]=0
maskaddx[7]=-6 maskaddy[7]=0
maskaddx[8]=-6 maskaddy[8]=0
maskaddx[9]=-6 maskaddy[9]=0
maskaddx[10]=-6 maskaddy[10]=0
maskaddx[11]=-6 maskaddy[11]=0
check=1
}

if argument0=sprPAttackSnap {
maskaddx[0]=8 maskaddy[0]=0
maskaddx[1]=8 maskaddy[1]=0
maskaddx[2]=8 maskaddy[2]=1
maskaddx[3]=8 maskaddy[3]=1
maskaddx[4]=8 maskaddy[4]=1
maskaddx[5]=8 maskaddy[5]=1
maskaddx[6]=8 maskaddy[6]=-1
maskaddx[7]=8 maskaddy[7]=-1
maskaddx[8]=8 maskaddy[8]=-1
maskaddx[9]=8 maskaddy[9]=-1
maskaddx[10]=8 maskaddy[10]=-1
maskaddx[11]=8 maskaddy[11]=-1
maskaddx[12]=8 maskaddy[12]=-1
check=1
}


if argument0=sprPAttackThroat {
maskaddx[0]=-6 maskaddy[0]=0
maskaddx[1]=-6 maskaddy[1]=0
maskaddx[2]=-6 maskaddy[2]=0
maskaddx[3]=-6 maskaddy[3]=0
maskaddx[4]=-6 maskaddy[4]=0
maskaddx[5]=-6 maskaddy[5]=0
maskaddx[6]=-6 maskaddy[6]=0
maskaddx[7]=-6 maskaddy[7]=0
maskaddx[8]=-6 maskaddy[8]=0
maskaddx[9]=-6 maskaddy[9]=0
maskaddx[10]=-6 maskaddy[10]=0
maskaddx[11]=-6 maskaddy[11]=0
check=1
}

if argument0=sprPWalkThrow {
maskaddx[0]=0 maskaddy[0]=0
maskaddx[1]=0 maskaddy[1]=1
maskaddx[2]=0 maskaddy[2]=1
maskaddx[3]=0 maskaddy[3]=1
maskaddx[4]=0 maskaddy[4]=0
maskaddx[5]=0 maskaddy[5]=-1
maskaddx[6]=0 maskaddy[6]=-1
check=1
}

if argument0=sprPAttackKnife {
maskaddx[0]=0 maskaddy[0]=0
maskaddx[1]=0 maskaddy[1]=0
maskaddx[2]=0 maskaddy[2]=0
maskaddx[3]=0 maskaddy[3]=0
maskaddx[4]=0 maskaddy[4]=-1
maskaddx[5]=0 maskaddy[5]=-1
maskaddx[6]=0 maskaddy[6]=-1
maskaddx[7]=0 maskaddy[7]=-1
maskaddx[8]=0 maskaddy[8]=-1
check=1
}

if argument0=sprPAttackPipe or argument0=sprPAttackClub or argument0=sprPAttackBat or sprite_index=sprPAttackCrowbar {
maskaddx[0]=0 maskaddy[0]=2
maskaddx[1]=0 maskaddy[1]=0
maskaddx[2]=0 maskaddy[2]=-1
maskaddx[3]=0 maskaddy[3]=-1
maskaddx[4]=0 maskaddy[4]=0
maskaddx[5]=0 maskaddy[5]=1
maskaddx[6]=0 maskaddy[6]=2
maskaddx[7]=0 maskaddy[7]=2
maskaddx[8]=0 maskaddy[8]=2
check=1
}

if argument0=sprPAttackSword {
maskaddx[0]=0 maskaddy[0]=2
maskaddx[1]=0 maskaddy[1]=-1
maskaddx[2]=0 maskaddy[2]=-1
maskaddx[3]=0 maskaddy[3]=0
maskaddx[4]=0 maskaddy[4]=1
maskaddx[5]=0 maskaddy[5]=2
maskaddx[6]=0 maskaddy[6]=2
check=1
}

if argument0=sprPAttackThrow {
maskaddx[0]=0 maskaddy[0]=0
maskaddx[1]=0 maskaddy[1]=-1
maskaddx[2]=0 maskaddy[2]=-1
maskaddx[3]=0 maskaddy[3]=0
check=1
}

if argument0=sprPAttackM16 {
maskaddx[0]=0 maskaddy[0]=-1
maskaddx[1]=0 maskaddy[1]=0
check=1
}

if argument0=sprPAttackShotgun {
maskaddx[0]=0 maskaddy[0]=-1
maskaddx[1]=0 maskaddy[1]=-1
maskaddx[2]=0 maskaddy[2]=-1
maskaddx[3]=0 maskaddy[3]=0
maskaddx[4]=0 maskaddy[4]=0
maskaddx[5]=0 maskaddy[5]=0
maskaddx[6]=0 maskaddy[6]=0
maskaddx[7]=0 maskaddy[7]=0
maskaddx[8]=0 maskaddy[8]=0
maskaddx[9]=0 maskaddy[9]=0
maskaddx[10]=0 maskaddy[10]=0
maskaddx[11]=0 maskaddy[11]=0
check=1
}

if argument0=sprPAttackDoubleBarrel1 or argument0=sprPAttackDoubleBarrel2 {
maskaddx[0]=0 maskaddy[0]=-1
maskaddx[1]=0 maskaddy[1]=-1
maskaddx[2]=0 maskaddy[2]=-1
maskaddx[3]=0 maskaddy[3]=0
maskaddx[4]=0 maskaddy[4]=0
check=1
}

if argument0=sprPAttackPunch {
maskaddx[0]=0 maskaddy[0]=0
maskaddx[1]=0 maskaddy[1]=0
maskaddx[2]=0 maskaddy[2]=-1
maskaddx[3]=0 maskaddy[3]=-1
maskaddx[4]=0 maskaddy[4]=-1
maskaddx[5]=0 maskaddy[5]=0
maskaddx[6]=0 maskaddy[6]=0
check=1
}

if argument0=sprPAttackSilencer {
maskaddx[0]=0 maskaddy[0]=1
maskaddx[1]=0 maskaddy[1]=0
maskaddx[2]=0 maskaddy[2]=0
check=1
}

if argument0=sprPAttackScorpion {
maskaddx[0]=0 maskaddy[0]=1
maskaddx[1]=0 maskaddy[1]=0
check=1
}

if argument0=sprPAttackUzi {
maskaddx[0]=0 maskaddy[0]=1
maskaddx[1]=0 maskaddy[1]=0
check=1
}

if argument0=sprPAttackMagnum {
maskaddx[0]=0 maskaddy[0]=1
maskaddx[1]=0 maskaddy[1]=0
maskaddx[2]=0 maskaddy[2]=0
check=1
}

if argument0=sprPAttackBash or argument0=sprPBashBodyguard or argument0=sprBodyguardFinish2 {
maskaddx[0]=12 maskaddy[0]=0
maskaddx[1]=11 maskaddy[1]=0
maskaddx[2]=10 maskaddy[2]=0
maskaddx[3]=10 maskaddy[3]=0
check=1
}

if argument0=sprPAttackFaceKick {
maskaddx[0]=-17 maskaddy[0]=-3
maskaddx[1]=-17 maskaddy[1]=-3
maskaddx[2]=-17 maskaddy[2]=-3
maskaddx[3]=-17 maskaddy[3]=-3
maskaddx[4]=-17 maskaddy[4]=-3
maskaddx[5]=-20 maskaddy[5]=-4
maskaddx[6]=-20 maskaddy[6]=-4
maskaddx[7]=-17 maskaddy[7]=-3
maskaddx[8]=-17 maskaddy[8]=-3
maskaddx[9]=-17 maskaddy[9]=-3
check=1
}

if argument0=sprPWalkGirlfriend {
maskaddx[0]=0 maskaddy[0]=0
maskaddx[1]=0 maskaddy[1]=-1
maskaddx[2]=0 maskaddy[2]=-1
maskaddx[3]=0 maskaddy[3]=0
maskaddx[4]=0 maskaddy[4]=1
maskaddx[5]=0 maskaddy[5]=1
maskaddx[6]=0 maskaddy[6]=0
} 

if check=0 {
maskaddx[0]=0 maskaddy[0]=0
maskaddx[1]=0 maskaddy[1]=-1
maskaddx[2]=0 maskaddy[2]=-1
maskaddx[3]=0 maskaddy[3]=-1
maskaddx[4]=0 maskaddy[4]=0
maskaddx[5]=0 maskaddy[5]=1
maskaddx[6]=0 maskaddy[6]=1
maskaddx[7]=0 maskaddy[7]=1
maskaddx[8]=0 maskaddy[8]=0
} 
