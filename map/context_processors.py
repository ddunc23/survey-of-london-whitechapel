def last_feature(request):
	try:
		last_feature = request.GET.get('last_feature')
		return {'last_feature': last_feature }
	except KeyError:
		pass

def next_edit(request):
	try:
		next_edit = request.GET.get('next')
		return {'next_edit': next_edit }
	except KeyError:
		pass