/// PEd_instanceGenerateName(id)
/**
 * @brief Generates unique name for the given instance.
 * @param {real} id The id of the instance to generate the name for.
 * @return {string} The generated name.
 */
var _seed = random_get_seed();
var _name = "inst" + string(abs(argument0 - 100000));
randomize();
repeat (6) 
{
    _name += string(choose(irandom(9), chr(irandom_range(ord("A"), ord("Z")))));
}
random_set_seed(_seed);
return _name;
