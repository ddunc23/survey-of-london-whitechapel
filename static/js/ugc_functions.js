var editor = new MediumEditor('#id_body', {
	placeholder: {
		text: 'Click here to add text',
		hideOnClick: true,
	}
});

var hidden = true;

$('.toggle-help').click(function(e) {
	if (hidden == false) {
		$('.editor-help').animate({
			height: '60px',	
		});
		$('.toggle-help').html('Show Guide');
		hidden = true;
	} else {
		$('.editor-help').animate({
			height: '270px',	
		});
		$('.toggle-help').html('Hide Guide');
		hidden = false;
	}
});

$('.are_you_sure').click(function(e) {
	e.preventDefault();
	$('#submit_confirm').modal('show');
});

$('.approve').click(function(e) {
	if( $('#id_published').is(':checked')) {
		e.preventDefault();
		$('#approve_confirm').modal('show');
	}
});

