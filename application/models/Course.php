<?php

class Course extends CI_Model
{
  private $table = 'course';

  public function __counstruct()
  {
    parent::__construct();
    $this->load->database();
  }

  public function get_course()
  {
    $this->db->order_by('name', 'asc');
    $query = $this->db->get($this->table);
    return $query->result_array();
  }

  public function get_course_by_id($id)
  {
    $this->db->where('id', $id);
    $query = $this->db->get($this->table);
    return $query->row();
  }
}