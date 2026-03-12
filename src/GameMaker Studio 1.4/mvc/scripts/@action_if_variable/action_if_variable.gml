/// @description (Old DnD) - if variable evauation
/// @param val1  value to check against
/// @param val2  value2 to check against
/// @param type	type of check (1=='<', 2=='>', 3=='<=', 4=='>='anything else is ==)
var ret = false;
switch( argument2 )
{
	case 1:	ret = (argument0 < argument1); break;	
	case 2:	ret = (argument0 > argument1); break;	
	case 3:	ret = (argument0 <= argument1); break;	
	case 4:	ret = (argument0 >= argument1); break;	
	default:ret = (argument0 == argument1); break;	
}
return ret;