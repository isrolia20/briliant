<?php $this->load->view('home/layouts/head-landingpage'); ?>
<div class="loader-bg">
	<div class="loader-p">
		Permata Smart
	</div>
</div>
<main id="main" data-aos="fade-in">

	<!-- ======= Breadcrumbs ======= -->
	<div class="breadcrumbs">
		<div class="container">
			<h2>Briliant</h2>
			<p>Mata Pelajaran <?= $course->name ?></p>
      <p>Pilih guru private !</p>
		</div>
	</div><!-- End Breadcrumbs -->
	<!-- ======= Courses Section ======= -->
	<section class="w-100" data-aos="fade-up">
		<div class="d-flex flex-wrap justify-content-center w-100 p-5" data-aos="zoom-in" data-aos-delay="100">
			<?php foreach ($data as $row) : ?>
				<div class="w-25 h-full m-3">
					<div class="card shadow rounded w-100 flex flex-col p-3">
						<div class="mx-auto w-50">
							<img src="<?= base_url('assets/landingpage/img/illust_1.png'); ?>" class="img-fluid" />
						</div>
						<div class="d-flex flex-row ms-2 mb-2">
							<span>Nama : </span>
							<span class="ms-2 text-capitalize text-bold"><?= $row->name; ?></span>
						</div>
						<div class="d-flex flex-row ms-2 mb-2">
							<span>Status : </span>
							<span class="ms-2 text-capitalize text-bold"><?= $row->is_available == 'available' ? 'Kosong' : 'Penuh'; ?></span>
						</div>
						<div class="d-flex flex-row ms-2 mb-2">
							<span>Mapel : </span>
							<span class="ms-2 text-capitalize text-bold"><?= $course->name ?></span>
						</div>
						<div class="d-flex flex-row ms-2 mb-2">
							<span>Pekerjaan : </span>
							<span class="ms-2 text-capitalize text-bold"><?= $row->profession ?></span>
						</div>
						<div class="d-flex flex-row ms-2 mb-2">
							<span>NIK : </span>
							<span class="ms-2 text-capitalize text-bold"><?= $row->nik ?></span>
						</div>
						<div class="my-3 w-100">
							<a class="btn btn-outline-primary justify-content-center d-flex align-items-center" onclick="chooseTutor(<?= $row->id ?>, <?= $row->price ?>)">
								<span class="me-3">Pilih</span>
								<i class="fas fa-arrow-right"></i>
							</a>
							<a href="#" class="btn btn-primary justify-content-center d-flex align-items-center mt-3">
								<span class="me-3">Jadwal</span>
								<i class="fas fa-calendar"></i>
							</a>
						</div>
					</div>
				</div>
			<?php endforeach; ?>
		</div>
	</section><!-- End Courses Section -->

</main>
<?php $this->load->view('home/layouts/footer-landingpage'); ?>