#define window_resize_fix_init
/// ()->bool
var f1, f2, f3, ver;
/* GMS >= 2.3:
ver = 2;
var _display_set_size = -1;
for (var i = 0; i < 500; i++) {
    if (script_get_name(i) == "display_set_size") {
        _display_set_size = i;
        break;
    }
}
f1 = method(undefined, window_set_fullscreen);
//f2 = method(undefined, draw_enable_drawevent);
f3 = method(undefined, _display_set_size);
/*/
ver = 1;
variable_global_set("window_set_fullscreen", variable_global_get("window_set_fullscreen"));
f1 = variable_global_get("window_set_fullscreen");
variable_global_set("draw_enable_drawevent", variable_global_get("draw_enable_drawevent"));
f2 = variable_global_get("window_set_fullscreen");
variable_global_set("display_set_size", variable_global_get("display_set_size"));
f3 = variable_global_get("display_set_size");
//*/
return window_resize_fix_init_raw(ptr(f1), ptr(f3), window_handle(), ver);