<?php $this->load->view('auth/layouts/head-login'); ?>
<div id="app">
	<section class="section">
		<div class="container mt-5">
			<div class="row">
				<div class="col-12 col-sm-10 offset-sm-1 col-md-10 offset-md-2 col-lg-10 offset-lg-2 col-xl-10 offset-xl-2 mx-auto">
					<div class="login-brand">
						<!-- <img src="../assets/img/stisla-fill.svg" alt="logo" width="100" class="shadow-light rounded-circle"> -->
						<h3>Permata Smart</h3>

					</div>

					<div class="card card-primary">
						<div class="card-header">
							<h4>Daftar Sebagai Siswa</h4>
						</div>

						<div class="card-body">
							<form id="form-register">
								<div class="form-group">
									<label for="email">Email</label>
									<input id="email" type="email" class="form-control" name="email">
									<div class="text-danger"></div>
								</div>

								<div class="row">
									<div class="form-group col-6">
										<label for="password" class="d-block">Password</label>
										<input id="password" type="password" class="form-control pwstrength" data-indicator="pwindicator" name="password">
										<div class="text-danger"></div>
										<div id="pwindicator" class="pwindicator">
											<div class="bar"></div>
											<div class="label"></div>
										</div>
									</div>
									<div class="form-group col-6">
										<label for="password2" class="d-block">Password Confirmation</label>
										<input id="password2" type="password" class="form-control" name="password-confirm">
										<div class="text-danger"></div>
									</div>
								</div>

								<div class="form-divider">
									Data Diri
								</div>

								<div class="form-group">
									<label for="name">Nama Lengkap</label>
									<input id="name" type="text" class="form-control" name="name" autofocus>
									<div class="text-danger"></div>
								</div>


								<div class="form-group">
									<label for="address">Alamat</label>
									<input id="address" type="text" class="form-control" name="address" autofocus>
									<div class="text-danger"></div>
								</div>

								<div class="row">

									<div class="form-group col-6">
										<label>Jenis Kelamin</label>
										<select class="form-control selectric" name="sex" id="sex">
											<option value="laki-laki">Laki-Laki</option>
											<option value="perempuan">Perempuan</option>
										</select>
										<div class="text-danger"></div>
									</div>


									<div class="form-group col-6">
										<label for="phone_number">Nomor Telepon</label>
										<input id="phone_number" type="text" class="form-control" name="phone_number" autofocus>
										<div class="text-danger"></div>
									</div>
								</div>


								<div class="row">
									<div class="form-group col-6">
										<label for="parent">Nama Orangtua</label>
										<input id="parent" type="text" class="form-control" name="parent" autofocus>
										<div class="text-danger"></div>
									</div>

									<div class="form-group col-6">
										<label for="phone_number_parent">Nomor Orangtua</label>
										<input id="phone_number_parent" type="text" class="form-control" name="phone_number_parent" autofocus>
										<div class="text-danger"></div>
									</div>
								</div>



								<div class="form-group">
									<label for="bio">Bio</label>
									<input id="bio" type="text" class="form-control" name="bio" autofocus>
									<div class="text-danger"></div>
								</div>


								<div class="form-group">
									<label for="school">Nama Sekolah</label>
									<input id="school" type="text" class="form-control" name="school" autofocus>
									<div class="text-danger"></div>
								</div>

								<div class="row">
									<div class="form-group col-6">
										<label>Tingkatan</label>
										<select class="form-control selectric" readonly id="level" name="level">
											<option value="sd" selected>SD</option>
										</select>
										<div class="text-danger"></div>
									</div>

									<div class="form-group col-6">
										<label for="class">Kelas</label>
										<input type="number" min="1" max="6" class="form-control" name="class" id="class" autofocus>
										<div class="text-danger"></div>
									</div>
								</div>

								<div class="form-group">
									<button type="submit" class="btn btn-primary btn-lg btn-block">
										Register
									</button>
								</div>
							</form>
						</div>
					</div>
					<div class="simple-footer">
						Copyright &copy; Briliant <?= Date('Y'); ?>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
<?php $this->load->view('auth/layouts/footer-register-siswa'); ?>