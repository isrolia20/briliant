<section class="section">
	<div class="section-header"><a href="/">
			<h1><?= $title; ?></h1>
		</a></div>
	<div class="section-body">
		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-header">
						<h4>Table Mata Pelajaran</h4>
						<!-- <div class="card-header-action"><button class="btn btn-primary" onclick="add()">Tambah Data</button></div> -->
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table id="myTable" class="table text-capitalize" cellspacing="0" width="100%">
								<thead>
									<tr>
										<th scope="col">#</th>
										<th scope="col">Nama Siswa</th>
										<th scope="col">Paket</th>
										<th scope="col">Status</th>
										<th scope="col">Total</th>
										<!-- <th scope="col">Jadwal</th> -->
										<th scope="col">Tutor</th>
										<!-- <th scope="col">Is Active</th> -->
										<th scope="col">Bukti Pembayaran</th>
										<th scope="col">Action</th>
									</tr>
								</thead>
								<tbody class="table-content">
									<?php
									$no = 1;
									foreach ($data_transaksi as $dtt) : ?>
										<tr>
											<td>
												<?= $no++; ?>
											</td>
											<td>
												<?= $dtt['student_name'] ?>
											</td>
											<td>
												<?= $dtt['package_name'] ?>
											</td>
											<td>
												<?= $dtt['status'] ?>
											</td>
											<td>
												<?= $dtt['total'] ?>
											</td>
											<td>
												<?= $dtt['tutor'] ?>
											</td>
											<td>
												<div class="card" style="width: 8rem;">
													<img src="<?= base_url('upload/img/receipt/') . $dtt['receipt'] ?>" class="img-responsive" alt="receipt">
												</div>

											</td>
											<td>
												<a href="#edit<?= str_replace(" ", "_", strtolower($dtt['transaction_id'])); ?>" class="btn btn-primary btn-class" data-toggle="modal">
													<i class="fas fa-edit"></i>
												</a>
												<button class="btn btn-danger btn-class" onclick="deleteList(<?= $dtt['transaction_id']; ?>)">
													<i class="fa fa-trash"></i>
												</button>
											</td>
										</tr>
									<?php endforeach; ?>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>