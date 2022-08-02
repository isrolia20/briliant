<nav class="navbar navbar-expand-lg shadow-md">
	<div class="container">
		<a class="navbar-brand text-primary" href="<?= base_url(''); ?>">
			<img height="50" src="<?= base_url('assets/icon/icon_navbar.png'); ?>" alt="" srcset="">
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<!-- <span class="navbar-toggler-icon"></span> -->
			<i class="fa fa-bars text-white" aria-hidden="true"></i>
		</button>
		<div class="collapse navbar-collapse justify-content-lg-end" id="navbarNavDropdown">
			<ul class="navbar-nav ">
				<li class="nav-item">
					<a class="nav-link cursor-pointer text-primary active" aria-current="page" onclick="top_page()">Home</a>
				</li>
				<li class="nav-item">
					<a class="nav-link cursor-pointer text-primary" onclick="about()">Tentang Kami</a>
				</li>
				<li class="nav-item">
					<a class="nav-link cursor-pointer text-primary" onclick="price()">Harga</a>
				</li>
				<li class="nav-item">
					<a class="nav-link text-primary cursor-pointer" onclick="faq()">FAQ</a>
				</li>

				<!-- <li class="nav-item">
					<a href="<?= base_url('login'); ?>" type="button" class="btn btn-primary ms-lg-5 px-4 rounded-pill">Login</a>
				</li> -->
				<?php
				if ($this->session->userdata('name') == null) {
				?>
					<li class="nav-item">
						<a href="<?= base_url('login'); ?>" type="button" class="btn btn-primary ms-lg-5 px-4 rounded-pill">Login</a>
					</li>
				<?php
				} else {
				?>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle text-dark" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Hi, <?= $this->session->userdata('name') ? $this->session->userdata('name') : 'Not login Yet'; ?>
						</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown" data-bs-popper="none">
							<li><a class="dropdown-item" href="<?= base_url('/lesson'); ?>">Paket Bimbel</a></li>
							<li><a class="dropdown-item" href="<?= base_url('/payment'); ?>">Pembayaran</a></li>
							<li><a class="dropdown-item" href="<?= base_url('/my-schedule'); ?>">Jadwal Saya</a></li>
							<li class="dropdown-divider">
							</li>
							<li><a class="dropdown-item" href="<?= base_url('/logout'); ?>">Logout</a></li>
						</ul>
					</li>
				<?php } ?>

				<!-- <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
              data-bs-toggle="dropdown" aria-expanded="false"><li></li>
              Dropdown link
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
              <li><a class="dropdown-item" href="#">Action</a></li>
              <li><a class="dropdown-item" href="#">Another action</a></li>
              <li><a class="dropdown-item" href="#">Something else here</a></li>
            </ul>
          </li> -->
			</ul>
		</div>
	</div>
</nav>
<script>
	const current_url = window.location.href;
	const base_url = "<?php echo base_url() ?>";

	const setMenu = (params) => {
		localStorage.setItem('currUrl', params);
	}

	const getMenu = () => {
		return localStorage.getItem('currUrl');
	}


	const top_page = () => {
		setMenu('hero');
		if (current_url === `${base_url}`) {
			const element = document.getElementById('hero');
			element.scrollIntoView({
				behavior: 'smooth'
			});
		} else {
			location.href = `${base_url}`;
		}
	}

	const about = () => {
		setMenu('about_us');
		if (current_url === `${base_url}`) {
			const element = document.getElementById('section-2');
			element.scrollIntoView({
				behavior: 'smooth'
			});
		} else {
			location.href = `${base_url}`;
		}
	}

	const price = () => {
		setMenu('price');
		if (current_url === `${base_url}`) {
			const element = document.getElementById('section-3');
			element.scrollIntoView({
				behavior: 'smooth'
			});
		} else {
			location.href = `${base_url}`;
		}
	}

	const faq = () => {
		setMenu('faq');
		if (current_url === `${base_url}`) {
			const element = document.getElementById('section-4');
			element.scrollIntoView({
				behavior: 'smooth'
			});
		} else {
			location.href = `${base_url}`;
		}
	}

	const renderPage = () => {
		if (current_url === `${base_url}`) {
			switch (getMenu()) {
				case 'hero':
					return top_page();
				case 'about_us':
					return about();
				case 'price':
					return price();
				case 'faq':
					return faq();
				default:
					return false;
			}
		} else {
			localStorage.removeItem('currUrl');
		}
	}

	window.addEventListener('load', function() {
		renderPage();
	})
</script>