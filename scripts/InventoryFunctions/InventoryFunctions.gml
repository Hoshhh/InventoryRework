function InventorySearch(rootObject, itemType) {
	for (var i = 0; i < INVENTORY_SLOTS; i++) {
		if (rootObject.inventory[i].itemInSlot == itemType) {
			return(i);
		}
	}
	return(-1);
}

function InventoryRemove(rootObject, itemType, _amount) {
	var _slot = InventorySearch(rootObject, itemType);
	if (_slot != -1) {
		with(rootObject) {
			inventory[_slot].amount -= _amount;
			
			if (inventory[_slot].amount <= 0) {
				inventory[_slot].itemInSlot = -1;	
			}
		}
		return true;
	} else return false;
}

function InventoryAdd(rootObject, itemType, _amount) {
	var _slot = InventorySearch(rootObject, -1);
	if (_slot != -1) {
		with(rootObject) {
			inventory[_slot].itemInSlot = itemType;
			inventory[_slot].amount = _amount;
		}
		return true;
	} else return false;
}

function InventorySwap(objectFrom, slotFrom, objectTo, slotTo) {
	var _itemFrom = objectFrom.inventory[slotFrom]
	objectFrom.inventory[slotFrom] = objectTo.inventory[slotTo];
	objectTo.inventory[slotTo] = _itemFrom;
}

function InventoryStack(rootObject, itemType, _amount, _slotFrom, _slotTo) {
	rootObject.inventory[_slotFrom].itemInSlot = -1;
	rootObject.inventory[_slotFrom].amount -= _amount;
	
	rootObject.inventory[_slotTo].itemInSlot = itemType;
	rootObject.inventory[_slotTo].amount += _amount;
}