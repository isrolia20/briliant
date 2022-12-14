<?php

class Student extends CI_Model
{
	var $table = 'students'; //nama tabel dari database
	var $column_order = array('students.id', 'email', 'name', 'address', 'phone_number', 'avatar',  'school', null);
	var $column_search = array('email', 'name', 'address', 'phone_number', 'avatar',  'school');
	var $order = array('students.id' => 'desc'); // default order 

	public function __construct()
	{
		parent::__construct();
		$this->load->database();
	}

	private function _get_datatables_query()
	{
		$this->db->select('*, students.id AS student_id');
		if ($this->input->post('id')) {
			$this->db->like('id', $this->input->post('id'));
		}
		if ($this->input->post('email')) {
			$this->db->like('email', $this->input->post('email'));
		}
		$this->db->from($this->table);
		$this->db->join('users', 'users.id = students.user_id', 'left');

		$i = 0;

		foreach ($this->column_search as $item) // looping awal
		{
			if ($_POST['search']['value']) // jika datatable mengirimkan pencarian dengan metode POST
			{

				if ($i === 0) // looping awal
				{
					$this->db->group_start();
					$this->db->like($item, $_POST['search']['value']);
				} else {
					$this->db->or_like($item, $_POST['search']['value']);
				}

				if (count($this->column_search) - 1 == $i)
					$this->db->group_end();
			}
			$i++;
		}

		if (isset($_POST['order'])) {
			$this->db->order_by($this->column_order[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
		} else if (isset($this->order)) {
			$order = $this->order;
			$this->db->order_by(key($order), $order[key($order)]);
		}
	}

	function get_datatables()
	{
		$this->_get_datatables_query();
		if ($_POST['length'] != -1)
			$this->db->limit($_POST['length'], $_POST['start']);
		$query = $this->db->get();
		return $query->result();
	}

	function count_filtered()
	{
		$this->_get_datatables_query();
		$query = $this->db->get();
		return $query->num_rows();
	}

	public function count_all()
	{
		$this->db->from($this->table);
		return $this->db->count_all_results();
	}
	public function add($table, $data)
	{
		$this->db->insert($table, $data);
		return $this->db->insert_id();
	}

	public function get_user($email)
	{
		$this->db->from('users');
		$this->db->where($email);
		$query = $this->db->get();
		return $query;
	}

	public function get_id($id)
	{
		$this->db->select('*, students.id AS student_id');
		$this->db->from($this->table);
		$this->db->join('users', 'users.id = students.user_id', 'left');
		$this->db->where('students.id', $id);
		$query = $this->db->get();
		return $query->row();
	}

	public function get_student_by_user($id){
		$this->db->where('user_id', $id);
		return $this->db->get($this->table)->row();
	}

	public function update($table, $id, $data)
	{
		// $this->db->where('id',$id);
		// $this->db->update($this->table,$data);
		$this->db->update($table, $data, $id);
		return $this->db->affected_rows();
	}
	public function delete($id)
	{
		$this->db->where('id', $id);
		return $this->db->delete($this->table);
	}

	public function validation_schedule($where){
		$this->db->where($where);
		$count = $this->db->get('schedule_student')->num_rows();
		if($count > 0){
			return false;
		}else{
			return true;
		}
	}

	public function get_schedule($where){
		$this->db->from('schedule_student');
		$this->db->join('tutors', 'schedule_student.tutor_id = tutors.id', 'left');
		$this->db->where($where);
		return $this->db->get($this->table)->result_array();
	}
	public function add_schedule($data){
		$this->db->insert('schedule_student', $data);
		return $this->db->insert_id();
	}
}