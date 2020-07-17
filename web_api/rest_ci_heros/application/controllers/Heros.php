<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
use Restserver\Libraries\REST_Controller;

class Heros extends REST_Controller {

    function __construct($config = 'rest') {
        parent::__construct($config);
        $this->load->database();
    }

    //Menampilkan data heros
    function index_get() {
        $heros = $this->db->get('heros')->result();
        $this->response(array("result"=>$heros, 200));
    }
	
	//Mengirim atau menambah data heros baru
    function index_post() {
		
		$flag=$this->post('flag');
		
		//Insert
		if($flag=="INSERT")
		{	
			//Config Upload
			$config['upload_path'] = './assets/files/heros/';
			$config['allowed_types'] = 'png|jpg';
			$config['max_size'] = '20480';
			$image = $_FILES['image']['name'];
			$path="./assets/files/heros/";
			$this->load->library('upload', $config);
			
			if (!$this->upload->do_upload('image')) 
			{
				$this->response(array('status' => 'fail', 502));
			} 
			else 
			{
				$data = array(
							'id'=> $this->post('id'),
							'name' => $this->post('name'),
							'description'=> $this->post('description'),
							'date'=> $this->post('date'),
							'image'=> $image);
				$insert = $this->db->insert('heros', $data);
				$this->response($data, 200);
			}
		}
		else if($flag=="UPDATE") //Update
		{
			//Config Upload
			$config['upload_path'] = './assets/files/heros/';
			$config['allowed_types'] = 'png|jpg';
			$config['max_size'] = '20480';
			$path="./assets/files/heros/";
			$image = $_FILES['image']['name'];
			$this->load->library('upload', $config);
			
			if (!$this->upload->do_upload('image')) 
			{
				$this->response(array('status' => 'fail', 502));
			} 
			else 
			{
				$id = $this->post('id');
				
				//Hapus Image Lama
				$queryimg = $this->db->query("SELECT image FROM `".$this->db->dbprefix('heros')."` WHERE id='".$id."'");
				$row = $queryimg->row();
				$picturepath="./assets/files/heros/".$row->image;	
				unlink($picturepath);
				
				$data = array(
					'id'=> $this->post('id'),
					'name' => $this->post('name'),
					'description'=> $this->post('description'),
					'date'=> $this->post('date'),
					'image'=> $image);
				$this->db->where('id', $id);
				$update = $this->db->update('heros', $data);
				$this->response($data, 200);	
			}
		}	
    }
	
	//Menghapus salah satu data heros
    function index_delete() {
        $id = $this->delete('id');
		
		//Hapus Image Lama
		$queryimg = $this->db->query("SELECT image FROM `".$this->db->dbprefix('heros')."` WHERE id='".$id."'");
		$row = $queryimg->row();
		$picturepath="./assets/files/heros/".$row->image;	
		unlink($picturepath);
		
        $this->db->where('id', $id);
        $delete = $this->db->delete('heros');
        if ($delete) {
            $this->response(array('status' => 'success'), 201);
        } else {
            $this->response(array('status' => 'fail', 502));
        }
    }

}
?>