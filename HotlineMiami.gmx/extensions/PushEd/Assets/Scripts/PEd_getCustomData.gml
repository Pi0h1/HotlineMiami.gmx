/// PEd_getCustomData(instance)
/**
 * @brief Gets custom data of the instance.
 * @param {real} instance The id of the instance.
 */
with (PEd_oEditor)
{
    if (!(object_is_ancestor(argument0.object_index, PEd_oObject2D)
        || argument0.object_index == PEd_oObject2D)
        && !(object_is_ancestor(argument0.object_index, PEd_oObject3D)
        || argument0.object_index == PEd_oObject3D))
    {
        if (global.pedUsing3D)
        {
            event_perform_object(PEd_oObject3D, ev_other, ev_user15);
        }
        else
        {
            event_perform_object(PEd_oObject2D, ev_other, ev_user15);
        }
    }

    event_perform_object(argument0.object_index, ev_other, ev_user15);
}
