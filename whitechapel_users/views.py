from django.shortcuts import render

# Create your views here.

def home(request, user):
	pass

def user_login(request, user):
	if request.method == 'POST':
		username = request.POST['username']
		password = request.POST['password']
		user = authenticate(username=username, password=password)
		if user is not None:
			if user.is_active:
				login(request, user)
				# Redirect to a success page.
			else:
				pass
		else:
			pass
	else:
		pass

	return render(request, 'whitechapel_users/login.html', {})
