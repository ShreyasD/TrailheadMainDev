({
	packItem : function(component, event, helper) {
		var packItemButton = event.getSource();
		var item = component.get("v.item", true);

		//Set button attribute
		a.Packed__c = true;
		component.set("v.item", a);

		//disable button
		packItemButton.set("v.disabled", true);
	}
})