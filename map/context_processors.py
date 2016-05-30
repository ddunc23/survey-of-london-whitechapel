def last_feature(request):
	try:
		last_feature = request.GET.get('last_feature')
		return {'last_feature': last_feature }
	except KeyError:
		pass