/// secUnit(speed,offset)
/*
optional argument 1 will be used as an offset to randomize the result
*/

if argument_count > 1
return ((current_time + argument[1])/(1000/60))*argument[0]

return (current_time/(1000/60))*argument[0]
