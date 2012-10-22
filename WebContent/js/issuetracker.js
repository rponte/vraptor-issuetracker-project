$.validator.setDefaults({
	highlight: function(label) {
	    $(label).closest('.control-group').addClass('error');
	},
	success: function(label) {
		$(label).closest('.control-group').removeClass('error');
		$(label).remove();
	}
});