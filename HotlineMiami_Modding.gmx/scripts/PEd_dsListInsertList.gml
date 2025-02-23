/// PEd_dsListInsertList(l1, pos, l2)
/**
 * @brief Inserts the list l2 into the list t1 at the given position.
 * @param {real} l1  The list to inserted into.
 * @param {real} pos The index to insert the list at.
 * @param {real} l2  The list to be inserted.
 */
gml_pragma("forceinline");
ds_list_insert(argument0, argument1, argument2);
ds_list_mark_as_list(argument0, argument1);
