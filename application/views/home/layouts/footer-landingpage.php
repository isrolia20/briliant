<footer class="shadow-md">
  <div class="container">
    <div class="row">
      <div class="col-lg-6 flex flex-row">
        <h1 class="footer-brand w-25">
          <img height="60" src="<?= base_url('assets/icon/icon_other.png'); ?>" alt="" srcset="">
        </h1>
        <div class="flex flex-col w-75 text-start">
          <p>Sitemap :</p>
          <div class="flex flex-row justify-content-between w-100">
            <ul class="footer-link w-50">
              <li class="footer-link__item"><a href="#">Beranda</a></li>
              <li class="footer-link__item"><a href="#">Tentang Kami</a></li>
            </ul>
            <ul class="footer-link w-50">
              <li class="footer-link__item"><a href="#">Harga</a></li>
              <li class="footer-link__item"><a href="#">FAQ</a></li>
            </ul>
          </div>
        </div>
      </div>
      <div class="col-lg-6">
        <div class="row">
          <div class="col-6 col-lg-4">
            <h2 class="footer-subtitle">Paket Bimbel</h2>
            <ul class="footer-link">
              <li class="footer-link__item"><a href="#">Paket SD</a></li>
            </ul>
          </div>
          <div class="col-6 col-lg-4">
            <h2 class="footer-subtitle">HUBUNGI KAMI</h2>
            <ul class="footer-link">
              <li class="footer-link__item"><a href="#">(0333)24567892</a></li>
            </ul>
          </div>
          <p class="footer-desc">Solusi menjadi siswa berprestasi bersama Biriliant tutoring.</p>
          <ul class="footer-sosmed">
            <li><i class="fab fa-facebook-square mx-2"></i></li>
            <li><i class="fab fa-twitter-square mx-2"></i></li>
            <li><i class="fab fa-linkedin mx-2"></i></li>
          </ul>
        </div>
      </div>
    </div>
    <div class="row justify-content-between">
      <div class="col-lg-6">
        <p class="dev-thanks">Copyright&copy; Briliant</p>
      </div>
    </div>
  </div>
</footer>
<script src="<?= base_url('assets/landingpage/js/jquery.js'); ?>"></script>
<script src="<?= base_url('assets/landingpage/js/bootstrap.bundle.min.js'); ?>"></script>
<script src="<?= base_url('assets/admin/js/swiper.min.js'); ?>"></script>
<script src="<?= base_url('assets/admin/js/aos.js'); ?>"></script>
<script>
  var galleryThumbs = new Swiper('.gallery-thumbs', {
    effect: 'coverflow',
    grabCursor: true,
    centeredSlides: true,
    slidesPerView: '2',
    // coverflowEffect: {
    //   rotate: 50,
    //   stretch: 0,
    //   depth: 100,
    //   modifier: 1,
    //   slideShadows : true,
    // },

    coverflowEffect: {
      rotate: 0,
      stretch: 0,
      depth: 50,
      modifier: 6,
      slideShadows: false,
    },

  });

  var swiper = new Swiper(".mySwiper", {
    effect: 'coverflow',
    // grabCursor: true,
    centeredSlides: true,
    slidesPerView: '3',
    pagination: {
      clickable: true,
      el: '.swiper-pagination',
      type: 'bullets',
    },
    initialSlide: 2,
    slideActiveClass: 'slide-center',
    // coverflowEffect: {
    //   rotate: 50,
    //   stretch: 0,
    //   depth: 100,
    //   modifier: 1,
    //   slideShadows : true,
    // },
    breakpoints: {
      // when window width is <= 499px
      499: {
        slidesPerView: '2',
      },
      993: {
        slidesPerView: '3',
      }
    },
    coverflowEffect: {
      rotate: 0,
      stretch: 0,
      depth: 50,
      modifier: 6,
      slideShadows: false,
    },
  });


  var galleryTop = new Swiper('.swiper-container.testimonial', {
    speed: 400,
    spaceBetween: 50,
    autoplay: {
      delay: 3000,
      disableOnInteraction: false,
    },
    direction: 'vertical',
    pagination: {
      clickable: true,
      el: '.swiper-pagination',
      type: 'bullets',
    },
    thumbs: {
      swiper: galleryThumbs
    }
  });

  $(document).ready(function() {
    setTimeout(() => {
      $('.loader-bg').fadeToggle();
      AOS.init({
        duration: 1000
      });
    }, 1500);

    $('.navbar-toggler').click(function(e) {
      $('#main').toggleClass('overlay')
      $('.navbar-collapse').toggleClass('show')
      $('i').toggleClass('fa-bars')
      $('i').toggleClass('fa-times')

      if ($('.navbar-toggle > i').hasClass('fa-bars')) {
        // $('.navbar-toggle > i').addClass('fa-cross')
      } else {
        // $('.navbar-toggle > i').addClass('fa-bars')        
      }
    });


    // Add smooth scrolling to all links
    $("a").on('click', function(event) {

      // Make sure this.hash has a value before overriding default behavior
      if (this.hash !== "") {
        // Prevent default anchor click behavior
        event.preventDefault();

        // Store hash
        var hash = this.hash;

        // Using jQuery's animate() method to add smooth page scroll
        // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
        $('html, body').animate({
          scrollTop: $(hash).offset().top
        }, 800, function() {

          // Add hash (#) to URL when done scrolling (default click behavior)
          window.location.hash = hash;
        });
      } // End if
    });
  });

  function chooseTutor(id, price) {
    console.log('tutor id', id);
    $.ajax({
      url: "<?= base_url('LandingController/tutor_checkout') ?>",
      type: "POST",
      dataType: 'json',
      data: {
        'tutor_id': id,
        'price': price
      },
      success: function(res) {
        if (res?.status === 403) {
          alert(res?.message);
          location.href = `${base_url}login`;
        } else {
          if (res?.status === 201) {
            alert(res?.message);
            location.href = `${base_url}payment`;
          } else {
            alert(res?.message);
          }
        }
      }
    })
  }
</script>
</body>

</html>