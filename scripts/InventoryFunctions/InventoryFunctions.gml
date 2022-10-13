function InventorySearch(rootObject, itemType) {
	for (var i = 0; i < INVENTORY_SLOTS; i++) {
		if (rootObject.inventory[i].itemInSlot == itemType) {
			return(i);
		}
	}
	return(-1);
}

function InventoryRemove(rootObject, itemType) {
	var _slot = InventorySearch(rootObject, itemType);
	if (_slot != -1) {
		with(rootObject) inventory[_slot] = -1;
		return true;
	} else return false;
}

function InventoryAdd(rootObject, itemType) {
	var _slot = InventorySearch(rootObject, -1);
	if (_slot != -1) {
		with(rootObject) inventory[_slot].itemInSlot = itemType;
		return true;
	} else return false;
}

function InventorySwap(objectFrom, slotFrom, objectTo, slotTo) {
	var _itemFrom = objectFrom.inventory[slotFrom]
	objectFrom.inventory[slotFrom] = objectTo.inventory[slotTo];
	objectTo.inventory[slotTo] = _itemFrom;
}