/// PEd_actMovePivotHere()
/**
 * @brief Moves pivot at the mouse position.
 */
if (global.pedUsing3D) 
{
    var _space = PEd_cameraScreenToPlaneXY(guiMousePressX, guiMousePressY, PEd_oPivot.z);
    PEd_oPivot.x = _space[0];
    PEd_oPivot.y = _space[1];
}
else 
{
    PEd_oPivot.x = (guiMousePressX - viewportX) * viewZoom + view_xview[0];
    PEd_oPivot.y = (guiMousePressY - viewportY) * viewZoom + view_yview[0];
}
