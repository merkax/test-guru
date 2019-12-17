document.addEventListener('turbolinks:load', function () {
  var control = document.querySelector('.password-check');

  if (control) { control.addEventListener('input', passwordCheck) }
})

function passwordCheck() {
  var password = document.getElementById('user_password');
  var confirmation = document.getElementById('user_password_confirmation');
  var match = document.querySelector('.octicon-check').classList;
  var notMatch = document.querySelector('.octicon-x').classList;

  if (confirmation.value) {
    if (password.value === confirmation.value) {
      match.remove('hide');
      notMatch.add('hide');
      password.classList.add('border-green');
      confirmation.classList.add('border-green');
      password.classList.remove('border-red');
      confirmation.classList.remove('border-red');
    } else {
      match.add('hide');
      notMatch.remove('hide');
      password.classList.remove('border-green');
      confirmation.classList.remove('border-green');
      password.classList.add('border-red');
      confirmation.classList.add('border-red');
    }

  } else {
    match.add('hide');
    notMatch.add('hide');
    password.classList.remove('border-red');
    confirmation.classList.remove('border-red');
  }
}
