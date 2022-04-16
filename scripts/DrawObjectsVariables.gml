
var inst = id;
var array = variable_instance_get_names(inst);
var array_c = array_length_1d(array);

var text = "VARIABLES";

for (var i=0; i < array_c; i++)
{
    var var_name = array[i];
    text += "#" + var_name + ": " + string( variable_instance_get(inst, var_name));
}

txtDebug(x,y,text,true);
