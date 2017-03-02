({
	validateItemForm: function(component) {

	    // Simplistic error checking
        var validItem = true;

        // Name must not be blank
        var nameField = component.find("itemname");
        var itemname = nameField.get("v.value");
        if ($A.util.isEmpty(itemname)){
            validItem = false;
            nameField.set("v.errors", [{message:"Item name can't be blank."}]);
        }
        else {
            nameField.set("v.errors", null);
        }

        //Price field must not be 0
        var priceField = component.find("itemprice");
        var itemprice = priceField.get("v.value");
        if (itemprice == null){
            validItem = false;
            priceField.set("v.errors", [{message:"Item price can't be zero."}]);
        }
        else {
            priceField.set("v.errors", null);
        }

        //Quantity field must not be 0
        var quantityField = component.find("itemquantity");
        var itemquantity = quantityField.get("v.value");
        if (itemquantity == null){
            validItem = false;
            quantityField.set("v.errors", [{message:"Item quantity can't be zero."}]);
        }
        else {
            quantityField.set("v.errors", null);
        }
	    
	    return(validItem);
	},

	createExpense: function(component, newItem) {
	    var addEvent = component.getEvent("addItem");
	    createEvent.setParams({ "item": newItem });
	    createEvent.fire();

	    //Set Blank SObject
	    component.set("v.newItem",{ 'sobjectType': 'Camping_Item__c',
                    'Name': '',
                    'Quantity__c': 0,
                    'Price__c': 0,
                    'Packed__c': false }/>);
	},
})