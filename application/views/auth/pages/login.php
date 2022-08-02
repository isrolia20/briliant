<?php $this->load->view('auth/layouts/head-login'); ?>
<div id="app" class="vh-100">
	<section class="section">
		<div class="d-flex flex-wrap align-items-stretch h-full">
			<div class="col-lg-4 col-md-6 col-12 order-lg-1 min-vh-100 order-2 bg-white">
				<div class="p-4 m-3">
					<img height="70" class="mb-5" src="<?= base_url('assets/icon/icon_navbar.png'); ?>" alt="" srcset="">
					<h4 class="text-dark font-weight-normal">Selamat Datang di <span class="font-weight-bold text-primary">Briliant</span></h4>
					<!-- <p class="text-muted">Before you get started, you must login or register if you don't already have an account.</p> -->
					<?php
					$message = $this->session->flashdata('message');
					if (isset($message)) {
						echo '<div class="alert alert-danger">' . $message . '</div>';
						$this->session->unset_userdata('message');
					}
					?>
					<form method="POST" action="<?= base_url('AuthController/auth_user'); ?>" class="needs-validation" novalidate="">
						<div class="form-group">
							<label for="email">Email</label>
							<input id="email" type="email" class="form-control" name="email" tabindex="1" required autofocus>
							<div class="invalid-feedback">
								Please fill in your email
							</div>
						</div>

						<div class="form-group">
							<div class="d-block">
								<label for="password" class="control-label">Password</label>
								<div class="float-right">
									<a href="auth-forgot-password.html" class="text-small">
										Forgot Password?
									</a>
								</div>
							</div>
							<input id="password" type="password" class="form-control" name="password" tabindex="2" required>
							<div class="invalid-feedback">
								please fill in your password
							</div>
						</div>
						<div class="form-group">
							<label for="email">Masuk Sebagai: </label>
							<select class="form-control" id="role" name="role">
								<option selected value="siswa">Siswa</option>
								<option value="tutor">Tutor</option>
							</select>
						</div>

						<div class="form-group">
							<button type="submit" class="btn btn-primary btn-lg btn-block" tabindex="4">
								Login
							</button>
						</div>
					</form>
					<div class="text-center mt-5 text-small text-dark">
						Belum punya akun?, <span class="fw-bold text-primary cursor-pointer"><a onclick="register()">Daftar Sekarang</a></span>
					</div>
					<div class="text-center text-small">
						<span class="text-dark">Copyright</span> <span class="text-primary">&copy; by Briliant</span>
					</div>
				</div>
			</div>
			<div class="col-lg-8 col-12 order-lg-2 order-1 h-full background-walk-y position-relative overlay-gradient-bottom" data-background="<?= base_url('assets/img/bg-login.jpeg'); ?>" style="background: url('<?= base_url('assets/img/bg-login.jpeg'); ?>');">
			</div>
		</div>
	</section>
</div>
<script>
	const current_url = window.location.href;
	const base_url = "<?php echo base_url() ?>";
	window.addEventListener('load', function() {
		localStorage.removeItem('currUrl');
	});
	function register(){
		const element = document.getElementById('role');
		if (element.value === 'siswa'){
			location.href = `${base_url}register/siswa`;
		} else {
			location.href = `${base_url}register/tutor`;
		}
	}
</script>