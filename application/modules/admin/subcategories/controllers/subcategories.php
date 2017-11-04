<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Subcategories extends Admincore
{
    function __construct()
    {
        parent::__construct();
        $this->load->model('subcategories_model','model');
    }
    
    /* METHOD "READ"
     * berfungsi untuk membaca query dari database dengan system pagination
     */
    function index()
    {
        $data['include'] =   $this->load->view('/read/include','',TRUE);
        $data['content'] =   $this->load->view('/read/content',$data,TRUE);
        $this->load->view("admin/main",$data);
    }
    
        
     /* METHOD "SEARCH"*/
    function search()
    {
        $data['include'] =   $this->load->view('/search/include','',TRUE);
        $data['content'] =   $this->load->view('/search/content',$data,TRUE);
        $this->load->view("admin/main",$data);
    }
    
     function create()
    {
	$this->load->library('form_validation');
        $this->form_validation->CI =& $this;
        $this->form_validation->set_error_delimiters('<p class="text-error">', '</p> ');
	if(!empty($_POST['x']))
        {
	    foreach($_POST['x'] as $row => $val) {
	    $this->form_validation->set_rules("x[$row][code]",'code','required|trim');
	    $this->form_validation->set_rules("x[$row][label]",'label','required|trim');
	   }
	}
	
        if ($this->form_validation->run() == FALSE)
        {
	  $data['content'] = $this->load->view('/create/content','',TRUE);
          $this->load->view('/admin/main',$data);
	}
        else
        {
	  foreach($_POST['x'] as $row) {
            core::insert('subcategories','parksms',[
				    'idcategories'  => $row['category'],
                    'code' => $row['code'],
				    'label' => $row['label'],
                    'idpbk_groups' => $row['group'],
				]);
	  }
            redirect('subcategories');
        }
    }

    
    /* METHOD "UPDATE"
     * berfungsi untuk mengupdate data dari database
     */
    function update($id = '')
    {
        $this->load->library('form_validation');
        $this->form_validation->CI =& $this;
        $this->form_validation->set_error_delimiters(' <ul class="help-block"><li class="text-error">', '</li></ul> ');  
        
        if ($this->form_validation->run('update') == FALSE)
        {
            $data['include'] =   $this->load->view('/update/include','',TRUE);
            $data['content'] =   $this->load->view('/update/content',$data,TRUE);
            $this->load->view("admin/main",$data);
        }
        else
        {
            core::update('subcategories','parksms',array(
				'idcategories' => $this->input->post('idcategories'),
				'idpbk_groups' => $this->input->post('idpbk_groups'),
                'code' => $this->input->post('code'),
				'label' => $this->input->post('label'),
				),$this->input->post('idsubcategories'),
            'idsubcategories'
        );
            redirect('subcategories');
        }
    }
    
    function detail($id = '')
    {
        $data['include'] =   $this->load->view('/detail/include','',TRUE);
        $data['content'] =   $this->load->view('/detail/content',$data,TRUE);
        $this->load->view("admin/main",$data);
    }
    // ACTIONS METHOD
    // method-method yang berfungsi hanya untuk sebuah actions/tidak ada view
    
    /* METHOD "DELETE"
     * berfungsi untuk menghapus data dari database
     */
    function delete($id = '')
    {
        core::delete('subcategories','parksms','idsubcategories',$id);
        redirect('subcategories');
    }
    
    
}