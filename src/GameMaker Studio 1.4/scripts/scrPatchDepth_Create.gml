switch (object_index){
    case objDebris:
    case objBrains:
    case objShard:
    case objTinyShard:
    case objPWater: 
        scrPatchDepthDebris_Create(); 
        break;
        
    case objDeadBody:
        scrPatchDepthCorpse_Create(); 
        break;
        
    case objBrains2:
    case objBrainChunk2:
    case objGuts2:
    case objSkinPiece2:
        scrPatchDepthGore_Create(); 
        break;
        
    case objBloodSplat2:
    case objBloodSplat:
    case objBloodPool:
        scrPatchDepthBlood_Create(); 
        break;
        
    case objBombGround:
        scrPatchDepthBombGround_Create();
        break;
    
    default:
        break;
}
 
