var c = c_yellow
draw_set_font(fnt_smalldigits);

for (var j = 0; j < INVENTORY_SLOTS; j++) {
	var ydist = 20
	draw_text_color(10,ydist*j + 10, string(inventory[j]) + "\n", c,c,c,c, 1);
}


draw_sprite_part_ext(
	spr_inv_ui, 0, cell_size, 0, inv_ui_width, inv_ui_height, 
	inv_ui_x, inv_ui_y, scale, scale, c_white, 1);
	
var sx = 0;
var sy = 0;
	
for (var i = 0; i < INVENTORY_SLOTS; i++) {
	
	var ix = i mod inv_slots_width;
	var iy = i div inv_slots_width;	
	var xx = slots_x + ((cell_size + x_buffer)*ix*scale);
	var yy =  slots_y + ((cell_size + y_buffer)*iy*scale);
	
	var iitem = inventory[i].itemInSlot
	if (iitem > 0) {
		sx = (iitem mod spr_inv_items_columns)*cell_size;
		sy = (iitem div spr_inv_items_columns)*cell_size;	
	}
	
	//Draw slots and item
	draw_sprite_part_ext(spr_inv_ui,0,0,0, cell_size, cell_size, xx , yy, scale, scale, c_white, 1);
	
	switch(i) {
	
		case selected_slot: 
			if (iitem > 0) {
				draw_sprite_part_ext(spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, scale, scale, c_white, 1);	
			}
			
			if (mouse_in_inventory) {	
				draw_sprite_ext(spr_inventory_selected,0, xx-8, yy-8, scale, scale, 0, c_white, 1); //Selected sprite
			}
		break;
		
		default: 
			if (iitem > 0) {	
				draw_sprite_part_ext(spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, scale, scale, c_white, 1);	
			}
		break;
	}
	
	//Draw item number
	if (iitem > 0)
	{
		var number = inventory[i].amount;
		var c = c_black;
		draw_text_color(xx + 3, yy + 3, string(number), c,c,c,c, 1);
	}
}

if (oMouse.itemDrag != 0) {
	iitem = oMouse.itemDrag;
	sx = (iitem mod spr_inv_items_columns)*cell_size;
	sy = (iitem div spr_inv_items_columns)*cell_size;	
	draw_sprite_part_ext(spr_inv_items, 0, sx, sy, cell_size, cell_size, mousex, mousey, scale, scale, c_white, 0.7);
}
