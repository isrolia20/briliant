<?php $this->load->view('home/layouts/head-landingpage-2'); ?>
<div class="loader-bg">
  <div class="loader-p">
    Permata Smart
  </div>
</div>
<main id="main" data-aos="fade-in">
  <!-- ======= Breadcrumbs ======= -->
  <div class="breadcrumbs">
    <div class="container mt-5">
      <h2>Jadwal</h2>
      <p>Daftar Jadwal yang telah aktif !</p>
    </div>
  </div><!-- End Breadcrumbs -->

  <section class="section text-dark">
    <div class="container" data-aos="fade-up">
      <div class="row">
        <div class="col-12">
          <table class="table">
            <thead>
              <tr>
                <th>No</th>
                <th>Nama Pengajar</th>
                <th>Mata Pelajaran</th>
                <th>Lihat Jadwal</th>
              </tr>
            </thead>
            <tbody>
              <?php
              $no = 1;
              foreach ($data as $row) : ?>
                <?php if ($row->status == 'verified') : ?>
                  <tr>
                    <td scope="row"><?= $no++ ?></td>
                    <td><?= $row->tutor; ?></td>
                    <td><?= $row->course; ?></td>
                    <td><button onclick="checkSchedule(<?= $row->tutor_id ?>, '<?= $row->course ?>')" class="btn btn-primary">Lihat</button></td>
                  </tr>
                <?php endif; ?>
              <?php endforeach; ?>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </section>
  </div>
  <div class="modal fade text-dark" id="modalSchedule" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title"></h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <table class="table">
            <thead>
              <tr>
                <th>No</th>
                <th>Hari</th>
                <th>Jam Mulai</th>
                <th>Jam Selesai</th>
              </tr>
            </thead>
            <tbody id="data-schedule">

            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
  <?php $this->load->view('home/layouts/footer-landingpage'); ?>
  <script>
    function checkSchedule(id, mapel) {
      $.ajax({
        url: "<?= base_url('LandingController/schedule_list') ?>",
        type: "POST",
        dataType: 'json',
        data: {
          'tutor_id': id
        },
        success: function(res) {
          if (res?.status !== 200) {
            alert(res?.message);
          } else {
            $('#modalSchedule').modal('show');
            $('#modalSchedule').find('.modal-title').html(mapel); 
            $('#modalSchedule').find('#data-schedule').html(renderRow(res?.data))
          }
        }
      })
    }
    const now = new Date();
    const weekdays = new Array(7);
    weekdays[0] = "minggu";
    weekdays[1] = "senin";
    weekdays[2] = "selasa";
    weekdays[3] = "rabu";
    weekdays[4] = "kamis";
    weekdays[5] = "jumat";
    weekdays[6] = "sabtu";

    function checkIfToday(params) {
      if(params === weekdays[now.getDay()]){
        return '<span class="text-danger">Hari ini</span>';
      }else{
        return '<span class="text-success">Bukan hari ini</span>'
      }
    }
    function renderRow(data) {
      let row = "";
      for (let i = 0; i < data.length; i++) {
        row += `<tr class='item-line'>
            <td>${i + 1}</td>
            <td>${data[i]?.date} ${checkIfToday(data[i]?.date)}</td>
            <td>${data[i]?.start_time}</td>
            <td>${data[i]?.end_time}</td>
        </tr>`;
      }
      return row;
    }
  </script>