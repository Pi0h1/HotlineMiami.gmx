////// Checks button state
// Argument0: Controller index
// Argument1: Button bitmask as word
if argument1=getid(5) {
test1=external_call(global.__checkButton,0,getid(5)) 
test2=external_call(global.__checkButton,0,getid(11)) 
return test1+test2
}
/*if argument1=getid(10) {
if external_call(global.__leftTrigger,argument0)>100 return true
}*/
return external_call(global.__checkButton,argument0,argument1)
