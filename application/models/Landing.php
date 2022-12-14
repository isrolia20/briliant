<?php


defined('BASEPATH') or exit('No direct script access allowed');

class Landing extends CI_Model
{
	public function get_leason()
	{
		$this->db->from('tutors');
		$this->db->join('users', 'users.id = tutors.user_id');
		$this->db->join('leasons', 'leasons.id = tutors.leauserson_id');
		$this->db->join('transactions', 'transactions.id = tutors.transaction_id');
		$query = $this->db->get();
		return $query->result();
	}

	public function get_student_id($id)
	{
		$this->db->select('*, students.id AS student_id');
		$this->db->from('students');
		$this->db->join('users', 'users.id = students.user_id', 'left');
		$this->db->where('users.id', $id);
		$query = $this->db->get();
		return $query->row();
	}

	public function get_payment($id)
	{
		$this->db->select('*,tutors.name AS tutor ,transactions.id AS transaction_id, students.name AS student_name, packages.name AS package_name, students.id AS student_id, packages.id AS package_id, leasons.name AS hari, features.name AS kelas');
		$this->db->from('transactions');
		$this->db->join('tutors', 'tutors.id = tutor_id', 'left');
		$this->db->join('students', 'students.id = transactions.student_id');
		$this->db->join('packages', 'packages.id = transactions.package_id');
		$this->db->join('leasons', 'leasons.package_id = packages.id');
		$this->db->join('features', 'features.package_id = packages.id');
		// $this->db->join('schedules', 'schedules.id = packages.schedule_id');
		$this->db->where('student_id', $id);

		$query = $this->db->get();
		return $query->result();
	}

	public function get_schedule($id)
	{
		$this->db->select('
			id,
			date,
			start_time,
			end_time,
			(SELECT COUNT(id) FROM transactions WHERE status="verified") AS count_student
		');
		$this->db->from('schedules');
		$this->db->where('tutor_id', $id);
		$query = $this->db->get();
		return $query->result();
	}
	public function get_schedule_by($where)
	{
		$this->db->select('
			schedule_student.id AS schedule_id,
			students.id AS student_id,
			tutors.name AS tutor,
			tutors.id AS tutor_id,
			course.name AS course,
			transactions.status AS status
		');
		$this->db->from('students');
		$this->db->join('schedule_student', 'students.id = schedule_student.student_id');
		$this->db->join('transactions', 'schedule_student.transaction_id = transactions.id', 'left');
		$this->db->join('tutors', 'schedule_student.tutors_id = tutors.id', 'left');
		$this->db->join('course', 'tutors.course_id = course.id', 'left');
		$this->db->where($where);
		return $this->db->get();
	}
	public function get_class()
	{
		$this->db->from('packages');
		// $this->db->join('packages', 'packages.id = package_id');
		$query = $this->db->get();
		return $query->result();
	}

	public function get_course(){
		$this->db->select('id, name');
		$this->db->from('course');
		return $this->db->get()->result();
	}

	public function get_packages()
	{
		// $this->db->select('*, packages.name AS package, schedules.schedule AS schedule');
		$this->db->select('*, packages.name AS package, leasons.name AS lsname, leasons.pukul AS lspukul, features.name AS fskelas');
		$this->db->from('packages');
		$this->db->join('features', 'features.package_id = packages.id');
		// $this->db->join('schedules', 'schedules.id = packages.schedule_id');
		$this->db->join('leasons', 'leasons.package_id = packages.id', 'inner');
		$query = $this->db->get();
		return $query->result();
	}

	public function update($table, $id, $data)
	{
		// $this->db->where('id',$id);
		// $this->db->update($this->table,$data);
		$this->db->update($table, $data, $id);
		return $this->db->affected_rows();
	}

	public function update_receipt($table, $id, $id_student, $data)
	{
		$this->db->where('id', $id);
		$this->db->where('student_id', $id_student);
		// $upd_data = array(
		// 	'receipt' => $data['receipt']
		// );
		// $upd_data = [
		// 	'receipt' => $data['receipt'],
		// ];
		// echo $id_student->student_id;
		$this->db->update($table, array('receipt' => $data['receipt']));
		// $this->db->update($this->table, $data);
		// $this->db->update($table, $data, $id);

		return $this->db->affected_rows();
	}

	public function get_faq()
	{
		$query = $this->db->from('faqs')->get();
		return $query->result();
	}

	public function get_list_schedule($where){
		$this->db->from('schedules');
		$this->db->where($where);
		return $this->db->get()->result_array();
	}
}
/* End of file Landing.php */
