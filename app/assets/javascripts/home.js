$(document).on("page:change", function(){
	$('a[href="' + this.location.pathname + '"]').parent().addClass('active');
});