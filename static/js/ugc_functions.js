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


$(document).ready(function() {
    // Limit upload size of all file inputs with a data-max-file-size attribute.
    $('input[type=file][data-max-file-size]').bind('change', function() {
        var max_file_size = $(this).data('maxFileSize'),
            current_file_size = this.files[0].size/1024; // in KB's

        // Remove any existing file errors
        $('.help-block', parent).remove();

        if (current_file_size > max_file_size) {
            var parent = $(this).parent();

            parent.addClass('has-error');

            parent.append(
                $('<span/>')
                    .addClass('help-block max-file-size-error')
                    .html('Image files should be under 2.5MB')
            );
        }
    });

    // Disable forms which have max-file-size errors.
    $('form').on('submit', function(e) {
        if ($('.max-file-size-error', this).length) {
            e.preventDefault();
        }
    });
});

