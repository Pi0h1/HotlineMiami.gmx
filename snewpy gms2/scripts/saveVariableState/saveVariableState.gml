function saveVariableState(){
	var map = argument0;
	var variable = argument1;

	if variable_instance_exists(self,variable){
	    map[? variable] = variable_instance_get(self,variable);
	}
}