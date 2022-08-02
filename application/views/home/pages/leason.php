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
			<p>Pilih mata pelajaran yang anda minati !</p>
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
						<div class="text-center">
							<span class="text-uppercase text-bold"><?= $row->name; ?></span>
						</div>
						<div class="mt-5 mb-3 w-100">
							<a href="<?= base_url("/lesson/".$row->id); ?>" class="btn btn-outline-primary justify-content-center d-flex align-items-center">
								<span class="me-3">Selengkapnya</span>
								<i class="fas fa-arrow-right"></i>
							</a>
						</div>
					</div>
				</div>
				<!-- <div class="w-25 card">
							<div class="course-item" style="min-width: 356px;">
								<img src="assets/img/course-1.jpg" class="img-fluid" alt="">
								<div class="course-content">
									<div class="d-flex justify-content-between align-items-center mb-3">
										
									</div>
								</div>
							</div>
						</div>
					</div> -->
			<?php endforeach; ?>
		</div>
	</section><!-- End Courses Section -->

</main>
<?php $this->load->view('home/layouts/footer-landingpage'); ?>