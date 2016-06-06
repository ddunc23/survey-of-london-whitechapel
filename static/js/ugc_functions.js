var editor = new MediumEditor('#id_body', {
	placeholder: {
		text: 'Click here to add text',
		hideOnClick: true,
	}
});
var editor = new MediumEditor('#id_description');

var hidden = false;

$('.toggle-help').click(function(e) {
	if (hidden == false) {
		$('.editor-help').animate({
			height: '60px',	
		});
		$('.toggle-help').html('Show Help');
		hidden = true;
	} else {
		$('.editor-help').animate({
			height: '220px',	
		});
		$('.toggle-help').html('Hide Help');
		hidden = false;
	}
});

$('.are_you_sure').click(function(e) {
	e.preventDefault();
	$('#submit_confirm').modal('show');
});