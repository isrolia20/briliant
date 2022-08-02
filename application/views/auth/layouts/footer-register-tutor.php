<!-- Bootstrap core JavaScript-->
<script src="<?= base_url('assets/vendor/jquery/jquery.min.js') ?>"></script>
<script src="<?= base_url('assets/vendor/bootstrap/js/bootstrap.bundle.min.js') ?>"></script>

<!-- Core plugin JavaScript-->
<script src="<?= base_url('assets/vendor/jquery-easing/jquery.easing.min.js') ?>"></script>
<script type="text/javascript" src="<?= base_url('/javascript/validation_register.js') ?>"></script>
<!-- <script>
  const base_url = '<?= base_url() ?>';
  let emptyVal = [];
  let activeValidation = false;
  const validRegexEmail = new RegExp(/^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/);
	// remove course
  const file = $('#file_pdf');
	const element = {
		email: $('#email'),
		password: $('#password'),
		password2: $('#password2'),
		name: $("#name"),
		address: $("#address"),
		sex: $("#sex"),
		phone: $("#phone_number"),
		profession: $("#profession"),
		bio: $("#bio"),
		course: $('#course'),
    nik: $('#nik'),
	};
  const isEmpty = (component) => {
    return component.parent().find('.validation').html('Kolom tidak boleh kosong');
  }

  $("#form-register").on('submit', function(e) {
    activeValidation = true;
    e.preventDefault();
    console.log(file.prop('files').length);
    if(file.prop("files").length < 1) {
      file.parent().find('.validation').html('Resume harap diupload !')
    }
    if (Object.keys(element).some(key => element[key].val() === "")) {
      emptyVal = Object.keys(element).filter(key => {
        if (element[key].val() === "") {
          return element[key]
        }
      });
      // console.log(params[emptyVal[0]].focus());
      emptyVal.map((item, index) => {
        element[emptyVal[index]].addClass('border-danger');
        isEmpty(element[emptyVal[index]]);
      });
      element[emptyVal[0]].focus();
      return false;
    } else {
      if (!validRegexEmail.test(element.email.val())) {
        element.password.addClass('border-danger').focus();
        $(this).parent().find('.validation').html('Format email tidak benar !');
      }
      if (element.password.val() !== element.password2.val()) {
        element.password.addClass('border-danger').focus();
        element.re_password.addClass('border-danger');
        element.re_password.parent().find('.validation').html('Password tidak sama !')
      } else {
        const formData = new FormData();
        formData.append('file', file.prop('files')[0]);
        $.ajax({
          url: "<?= base_url('AuthController/save_student')?>",
          type: "POST",
          dataType: 'json',
          data: formData,
          // data : {
          //   'email' : element.email.val(),
          //   'password': element.password.val(),
          //   'name':element.name.val(),
          //   'address': element.address.val(),
          //   'sex': element.sex.val(),
          //   'phone_number': element.phone.val(),
          //   'bio': element.bio.val(),
          //   'profession': element.profession.val(),
          //   'level': 'SD',
          //   'class': params.classes.val()
          // },
          success: function(res){
            console.log('res', res);
            // if(res?.status === 200){
            //   alert(res?.message);
            //   location.href = `${base_url}login`;
            // }else{
            //   alert(res?.message);
            // }
          }
        })
      }
    }
  });
</script> -->