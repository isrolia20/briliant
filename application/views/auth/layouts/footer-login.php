<!-- Bootstrap core JavaScript-->
<script src="<?= base_url('assets/vendor/jquery/jquery.min.js') ?>"></script>
<script src="<?= base_url('assets/vendor/bootstrap/js/bootstrap.bundle.min.js') ?>"></script>

<!-- Core plugin JavaScript-->
<script src="<?= base_url('assets/vendor/jquery-easing/jquery.easing.min.js') ?>"></script>
<script type="text/javascript" src="<?= base_url('/javascript/validation_register.js') ?>"></script>
<script>
  const base_url = '<?= base_url() ?>';
  let emptyVal = [];
  const validRegexEmail = new RegExp(/^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/);
  const params = {
    email: $("#email"),
    password: $("#password"),
    re_password: $("#password2"),
    name: $("#name"),
    address: $("#address"),
    sex: $("#sex"),
    phone: $("#phone_number"),
    parent: $("#parent"),
    phone_number_parent: $("#phone_number_parent"),
    bio: $("#bio"),
    school: $("#school"),
    level: $("#level"),
    classes: $("#class"),
  }
  const isEmpty = (component) => {
    return component.parent().find('.text-danger').html('Kolom tidak boleh kosong');
  }
  let activeValidation = false;
  $(document).ready(function() {
    //email handler
    params.email.on('input', function() {
      if ($(this).val() == "") {
        isEmpty($(this));
      } else {
        if (activeValidation) {
          if (validRegexEmail.test($(this).val())) {
            $(this).removeClass('border-danger');
            $(this).parent().find('.text-danger').html('');
          } else {
            $(this).addClass('border-danger');
            $(this).parent().find('.text-danger').html('Format email tidak benar !');
          }
        }
      }
    });
    //password handler
    params.password.on('keydown', function() {
      if (activeValidation) {
        if ($(this).val() !== "") {

        } else {
          $(this).addClass('border-danger');
          $(this).parent().find('.text-danger').html('Kolom tidak boleh kosong');
        }
      }
    });

  });

  $("#form-register").on('submit', function(e) {
    activeValidation = true;
    e.preventDefault();
    if (Object.keys(params).some(key => params[key].val() === "")) {
      emptyVal = Object.keys(params).filter(key => {
        if (params[key].val() === "") {
          return params[key]
        }
      });
      // console.log(params[emptyVal[0]].focus());
      emptyVal.map((item, index) => {
        params[emptyVal[index]].addClass('border-danger');
        isEmpty(params[emptyVal[index]]);
      });
      params[emptyVal[0]].focus();
      return false;
    } else {
      if (!validRegexEmail.test(params.email.val())) {
        params.password.addClass('border-danger').focus();
        $(this).parent().find('.text-danger').html('Format email tidak benar !');
      }
      if (params.password.val() !== params.re_password.val()) {
        params.password.addClass('border-danger').focus();
        params.re_password.addClass('border-danger');
        params.re_password.parent().find('.text-danger').html('Password tidak sama !')
      } else {
        $.ajax({
          url: "<?= base_url('AuthController/save_student')?>",
          type: "POST",
          dataType: 'json',
          data : {
            'email' : params.email.val(),
            'password': params.password.val(),
            'name': params.name.val(),
            'address': params.name.val(),
            'sex': params.sex.val(),
            'phone_number': params.phone.val(),
            'parent': params.parent.val(),
            'phone_number_parent': params.phone_number_parent.val(),
            'bio': params.bio.val(),
            'school': params.school.val(),
            'level': params.level.val(),
            'class': params.classes.val()
          },
          success: function(res){
            console.log('res', res);
            if(res?.status === 200){
              alert(res?.message);
              location.href = `${base_url}login`;
            }else{
              alert(res?.message);
            }
          }
        })
      }
    }
  });
</script>