inventoryHover = -1;
slotHover = -1;
inventoryDrag = -1;
slotDrag = -1;
itemDrag = -1;

mouseOver = function() {
	//Empty hover results
	slotHover = -1;
	inventoryHover = -1;
	
	//Check for inventory slot hover
	with(oInventory) {
		other.slotHover = selected_slot;
		other.inventoryHover = id;
	}
}

stateFree = function() {
	mouseOver()
	//Start to drag an item if slot is not empty
	if (mouse_check_button_pressed(mb_left)) and (slotHover != -1) and (inventoryHover.inventory[slotHover].itemInSlot != -1) {
		//Enter drag state
		state = stateDrag;
		itemDrag = inventoryHover.inventory[slotHover].itemInSlot;
		inventoryDrag = inventoryHover;
		slotDrag = slotHover;
	}
}

stateDrag = function() {
	mouseOver()
	if (mouse_check_button_pressed(mb_left)) {
		//Swap with slot hovering
		if (slotHover != -1) InventorySwap(inventoryDrag, slotDrag, inventoryHover, slotHover)
		
		//Return to free state
		state = stateFree;
		itemDrag = -1;
		inventoryDrag = -1;
		slotDrag = -1;
	}
}

state = stateFree