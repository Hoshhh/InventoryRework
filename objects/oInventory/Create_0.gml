#macro INVENTORY_SLOTS 15
depth = -1;
scale = 4;

cell_size = 16;
inv_slots_width = 6;
inv_slots_height = 4;
mouse_in_inventory = false;

selected_slot = 0;
m_slotx = 0;
m_sloty = 0;

x_buffer = 3;
y_buffer = 3;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

inv_ui_width = 203;
inv_ui_height = 88;

spr_inv_ui = spr_inventory_ui;
spr_inv_items = spr_inventory_items;

spr_inv_items_columns = sprite_get_width(spr_inv_items)/cell_size;
spr_inv_items_rows = sprite_get_height(spr_inv_items)/cell_size;

inv_ui_x = (gui_width * 0.5) - (inv_ui_width * 0.5 * scale);
inv_ui_y = (gui_height * 0.5) - (inv_ui_height * 0.5 * scale);

info_x = inv_ui_x;
info_y = inv_ui_y + (57 * scale);

slots_x = inv_ui_x + (84 * scale);
slots_y = inv_ui_y + (8 * scale);

//-------Items

enum item {
	none			= -1,
	orangepotion	= 1,
	greenpotion		= 2,
	redpotion		= 3,
	bluepotion		= 4,
	purplepotion	= 5,
	copperbar		= 6,
	copperore		= 7,
	ironbar			= 8,
	ironore			= 9,
	goldbar			= 10,
	goldore			= 11,
	batwing			= 12,
	wood			= 13,
	stone			= 14,
	centaury		= 15,
	wolfsbane		= 16,
	centauryseeds	= 17,
	wolfsbaneseeds	= 18,
	chest			= 19,
	furnacetable	= 20,
	alchemytable	= 21,
	height			= 22,
}

inventory = array_create(INVENTORY_SLOTS, -1)


var yy = 0; repeat(INVENTORY_SLOTS)
{
		inventory[yy] = {
			itemInSlot	: item.none,
			amount		: 0
		}
		yy += 1;
}
/*
inventory[0] = 
{
	itemInSlot	: item.copperore,
	amount		: 5
}

inventory[1] =  
{
	itemInSlot	: item.ironore,
	amount		: 5
}

inventory[2] = 
{
	itemInSlot	: item.goldore,
	amount		: 3
}
