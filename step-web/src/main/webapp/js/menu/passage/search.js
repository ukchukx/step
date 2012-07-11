$(step.menu).hear("MENU-SEARCH", function(self, menuTrigger) {
	
    var advancedSearch = $(".advancedSearch", step.util.getPassageContainer(menuTrigger.passageId));
	if(menuTrigger.menuItem.name == "ADVANCED_SEARCH") {
	    step.menu.untickAll(menuTrigger.menu.element, menuTrigger.passageId);
	    
	    //we show all sections:
	    $("fieldset", advancedSearch).show();
	    step.state.activeSearch(menuTrigger.passageId, "all");
	    refreshLayout();
	} else {
	    step.menu.tickOneItemInMenuGroup(menuTrigger);
//	    $.shout("refresh-passage-display", menuTrigger.passageId);
	    step.state.activeSearch(menuTrigger.passageId, menuTrigger.menuItem.name);
	}
});