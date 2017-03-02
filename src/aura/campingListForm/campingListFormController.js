({
	submitForm: function(component, event, helper) {

        // If we pass error checking, do some real work
        if(helper.validateItemForm(component)){
            // Create the new item
            var newItem = component.get("v.newItem");
            helper.createItem(component, newItem);
        }
    }
})