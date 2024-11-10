/// PEd_guiInit()
/**
 * @brief Initializes GUI.
 * @return {real} The id of the GUI root shape.
 */
enum PEdGUIShape
{
    Blank,
    Compound,
    Canvas,
    Dock,
    Viewport,
    Container,
    Scrollbar,
    Toolbar,
    ToolbarButton,
    ToolbarSwitch,
    Panel,
    Window,
    ContextMenu,
    ContextMenuItem,
    MenuBar,
    MenuBarItem,
};

enum PEdGUISplit
{
    Horizontal,
    Vertical,
};

enum PEdGUIResize
{
    None        = $0000,
    Left        = $1000,
    Top         = $0100,
    Right       = $0010,
    Bottom      = $0001,
    Horizontal  = $1010,
    Vertical    = $0101,
};

enum PEdColour
{
    Background        = $1E1E1E,
    Text              = $FFFFFF,
    TextSelected      = $FFFFFF,
    Input             = $252525,
    Section           = $2D2D2D,
    WindowBackground  = $2D2D2D,
    WindowBackground2 = $333333,
    WindowBorder      = $3F3F3F,
    WindowButton      = $686868,
    Scrollbar         = $9E9E9E,
    Highlight         = $686868,
    Active            = $A56428,
    Disabled          = c_gray,
    Shadow            = c_black,
    ShadowAlpha       = 1,
};

display_set_gui_maximise();

draw_set_font(PEd_fntNormal); 
guiFontHeight = string_height("Q");
guiFontWidth  = string_width("Q");
guiLineHeight = sprite_get_height(PEd_guiSprInput);

guiCursor        = cr_default;
guiShapes        = ds_list_create();
guiShapeId       = 0;
guiShapeHovered  = noone;
guiShapeActive   = noone;
guiShapeFilling  = noone;
guiShapeSelected = noone;
guiMouseX        = 0;
guiMouseY        = 0;
guiTooltip       = "";
guiMatrixStack   = ds_stack_create();
guiDestroyStack  = ds_stack_create();

// Input
guiInputSprite         = PEd_guiSprInput;
guiInputSpriteWidth    = sprite_get_width(guiInputSprite);
guiInputSpriteHeight   = sprite_get_height(guiInputSprite);
guiInputString         = "";
guiInputIndex[1]       = 1;
guiInputIndex[0]       = 1;
guiInputDrawIndexStart = 1;
guiInputMultitype      = 0;
guiInputTimer          = current_time;
guiInputActive         = noone;

// Popup message
guiPopupMessage  = "";
guiPopupTimer    = 0;
guiPopupDuration = 0;

// Context menu
guiContextMenu = noone;
guiMousePressX = noone;
guiMousePressY = noone;

// Keyboard shortcuts
guiKeyLog = ds_list_create();

// Root
guiRoot = PEd_guiCreateCompoundShape();
return guiRoot;
