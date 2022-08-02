<?php

class LandingController extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('Transaction', 'transaction_model');
		$this->load->model('Course', 'course_model');
		$this->load->model('Landing', 'model_data');
		$this->load->model('Student', 'student_model');
		$this->load->model('Tutor', 'tutor_model');
	}
	public function index()
	{
		$data['faqs'] = $this->model_data->get_faq();
		// $this->load->view('landing_page/pages/landing-page');
		$this->load->view('home/pages/landingpage', $data);
		// echo 'asdfsadf';
	}

	public function leason()
	{
		$data['data'] = $this->model_data->get_course();
		$this->load->view('home/pages/leason', $data);
	}

	public function schedule()
	{
		$user_id =  $this->session->userdata('id');
		$is_student = $this->session->userdata('role') == 'student' ? true : false;
		if (!$is_student) {
			return redirect('/login');
		}
		$student = $this->student_model->get_student_by_user($user_id);
		$where = array(
			'schedule_student.student_id' => $student->id
		);
		$data['data'] = $this->model_data->get_schedule_by($where)->result();
		$this->load->view('home/pages/schedule', $data);
	}

	public function schedule_list()
	{
		$where = array(
			'tutor_id' => $this->input->post('tutor_id')
		);
		$result = $this->model_data->get_list_schedule($where);
		$response = [
			'message' => 'Data gagal di inputkan, silahkan check kembali !',
			'status' => 200,
			'data' => $result
		];
		exit(json_encode($response));
	}

	public function tutor()
	{
		$data['course'] = $this->course_model->get_course_by_id($this->uri->segment('2'));
		$data['data'] = $this->tutor_model->get_tutor_by_id($this->uri->segment('2'))->result();
		$this->load->view('home/pages/tutor', $data);
	}

	private function validation_transaction($where)
	{
		$result = $this->transaction_model->validation_transaction($where);
		if ($result) {
			return true;
		} else {
			$response = [
				'message' => 'Data gagal di inputkan, silahkan check kembali !',
				'status' => 400,
			];
			exit(json_encode($response));
		}
	}

	private function validation_schedule($where)
	{
		$check = $this->student_model->validation_schedule($where);
		if ($check) {
			return true;
		} else {
			$response = [
				'message' => 'Data telah tersedia !',
				'status' => 400,
			];
			exit(json_encode($response));
		}
	}

	public function tutor_checkout()
	{
		// variable
		$tutor_id = $this->input->post('tutor_id');
		$user_id =  $this->session->userdata('id');
		$student = $this->session->userdata('role') == 'student' ? true : false;
		$price = $this->input->post('price');

		if (!$student) {
			$response = [
				'message' => 'Silahkan login terlebih dahulu !',
				'status' => 403,
			];
			exit(json_encode($response));
		} else {
			// get data student by user id
			$data_student = $this->student_model->get_student_by_user($user_id);
			// validation transaction is already taken
			$user = array(
				'student_id'  => $data_student->id,
				'tutor_id' =>  $tutor_id
			);

			// if transaction is not in database
			if ($this->validation_transaction($user)) {
				$time = time();
				$rand = rand(0, 9);
				$rand = str_pad($rand, 2, 0, STR_PAD_LEFT);
				$rand = $time . $rand;
				// action add transaction
				$id_transaction = $this->transaction_model->add(
					[
						"id" => $rand,
						"student_id" => $data_student->id,
						'tutor_id' =>  $tutor_id,
						'status' => 'pending',
						'discount' => null,
						'total' => $price
					]
				);
				if ($id_transaction) {
					if ($this->validation_schedule(['transaction_id' => $rand])) {
						$data_schedule = array(
							'student_id'  => $data_student->id,
							'tutors_id' =>  $tutor_id,
							'transaction_id' => $rand
						);
						$schedule = $this->student_model->add_schedule($data_schedule);
						if ($schedule) {
							$response = [
								'message' => 'Data berhasil disimpan !',
								'status' => 201,
							];
							exit(json_encode($response));
						} else {
							$response = [
								'message' => 'Data gagal disimpan !',
								'status' => 500,
							];
							exit(json_encode($response));
						}
					}
				} else {
					$response = [
						'message' => 'Data gagal disimpan !',
						'status' => 500,
					];
					exit(json_encode($response));
				}
			}
		}
	}

	public function payment()
	{
		$is_student = $this->session->userdata('role') == 'student' ? true : false;
		if (!$is_student) {
			return redirect('/login');
		} else {
			$user_id = $this->session->userdata('id');
			$student = $this->student_model->get_student_by_user($user_id);
			$data['data'] = $this->transaction_model->get_by_student($student->id)->result();
			$this->load->view('home/pages/payment', $data);
			// if (!$student) {
			// 	$data['data'] = $this->student_model->get_schedule($user);
			// 	$this->load->view('home/pages/payment', $data);
			// }
		}
	}

	public function form()
	{
		if ($this->session->userdata('name') == null) {
			return redirect('/login');
		}
		$data['class'] = $this->model_data->get_class();
		$this->load->view('home/pages/form', $data);
	}

	public function leasonCheckout()
	{
		$student = $this->session->userdata('role') == 'student' ? true : false;
		if (!$student) {
			redirect('login', 'refresh');
		}
	}

	public function uploadReceipt()
	{
		$data = [];
		if (!empty($_FILES['receipt']['name'])) {
			$upload = $this->_do_upload();
			$data['receipt'] = $upload;
		}
		// return var_dump($data, )
		$user_id = $this->session->userdata('id');
		$student = $this->student_model->get_student_by_user($user_id);
		// $receipt = $this->input->post('receipt');
		$transaction_id = $this->input->post('transaction_id');
		$this->model_data->update_receipt('transactions',  $transaction_id, $student->id,  $data);
		redirect('/payment', 'refresh');
	}


	private function _do_upload()
	{
		$config['upload_path']          = 'upload/img/receipt/';
		$config['allowed_types']        = 'gif|jpg|png|jpeg';
		$config['file_name']            = round(microtime(true) * 1000); //just milisecond timestamp fot unique name

		$this->load->library('upload', $config);

		if (!$this->upload->do_upload('receipt')) //upload and validate
		{
			$data['inputerror'][] = 'receipt';
			$data['error_string'][] = 'Upload error: ' . $this->upload->display_errors('', ''); //show ajax error
			$data['status'] = FALSE;
			echo json_encode($data);
			exit();
		}
		return $this->upload->data('file_name');
	}
}
