<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Inbox extends Admincore
{
    private $_command;

    function __construct()
    {
        parent::__construct();
        $this->load->model('inbox_model','model');
        core::update_where('inbox','parksms',array('Status' => -1),'Status',3);
    }

    /* METHOD "READ"
     * berfungsi untuk membaca query dari database dengan system pagination
     */
    function index()
    {
        $getInbox = $this->model->get_inbox();
        if($getInbox) {
          foreach ($getInbox as $keys => $values) {
            $this->smsReport($values);
          }
        }
        $data['include'] =   $this->load->view('/read/include','',TRUE);
        $data['content'] =   $this->load->view('/read/content',$data,TRUE);
        $this->load->view("admin/main",$data);
    }

    private function smsReport($data)
    {
        $sender = $data['SenderNumber'];
        $content = strtoupper($data['TextDecoded']);
        $smsID = $data['ID'];

        $split = explode('#', $content);
        $this->_command = $split[0];

        $code = $this->model->check_code($this->_command);
        if ($code == null) {
            $repliedText = "Maaf FORMAT KODE ".$this->_command." TIDAK DITEMUKAN, mohon periksa dan ulangi laporan";
            $this->replayedSMS($sender, $repliedText, $smsID);
        } else {
            if (count($split) !== 4) {
                $repliedText = "Maaf FORMAT LAPORAN SALAH, mohon periksa dan ulangi laporan";
                $this->replayedSMS($sender, $repliedText, $smsID);
            } else {
                $this->addReport($sender, $split, $smsID);
            }
        }
    }

    private function addReport($sender, $content, $smsID)
    {
        $data = array(
          'GroupID' => $this->_command,
          'RtNumber' => $content[1],
          'RwNumber' => $content[2],
          'suspect' => $content[3],
        );
        $returnId = $this->model->insert('pbk', 'parksms', $data);
        if($returnId) {
            $groups = $this->model->get_code();
            foreach ($groups as $value) {
                if ($this->_command == $value['code']) {
                    $this->forwardMessage($returnId, $value['idpbk_groups'], $value['label']);
                }
            }
            $repliedText = "Terima kasih, laporan anda telah kami TERIMA";
            $this->replayedSMS($sender, $repliedText, $smsID);
            return;
        }
        $repliedText = "Maaf, laporan anda GAGAL diterima, silahkan coba lagi";
        $this->replayedSMS($sender, $repliedText, $smsID);
    }
    
    private function forwardMessage($returnId, $idPic, $label)
    {
        $pic = $this->model->get_picPhone($idPic);
        $report = $this->model->get_report($returnId);
        $repliedText = 'Laporan :' . $label . ' di RT'. $report->RtNumber . ' RW' . $report->RwNumber;
        $this->replayedSMS($pic->phone, $repliedText);
    }

    private function replayedSMS($sender, $message, $smsID = null)
    {
        core::insert('outbox','parksms',array(
          'DestinationNumber' => $sender,
          'TextDecoded' => $message,
        ));
        core::response($sender, $message);
        
        if ($smsID !== null) {
            $query = "UPDATE inbox SET Processed = 'true' WHERE ID = '$smsID'";
            mysql_query($query);
        }
    }

     /* METHOD "SEARCH"*/
    function search()
    {
        $data['include'] =   $this->load->view('/search/include','',TRUE);
        $data['content'] =   $this->load->view('/search/content',$data,TRUE);
        $this->load->view("admin/main",$data);
    }

    /* METHOD "CREATE"
     * berfungsi untuk membuat / insert data ke dalam database
     */
    function create()
    {
        $this->load->library('form_validation');
        $this->form_validation->CI =& $this;
        $this->form_validation->set_error_delimiters(' <ul class="help-block"><li class="text-error">', '</li></ul> ');

        if ($this->form_validation->run('create') == FALSE)
        {
            $data['include'] =   $this->load->view('/create/include','',TRUE);
            $data['content'] =   $this->load->view('/create/content',$data,TRUE);
            $this->load->view("admin/main",$data);
        }
        else
        {
            core::insert('inbox','parksms',array(
				'UpdatedInDB' => $this->input->post('UpdatedInDB'),
				'Text' => $this->input->post('Text'),
				'SenderNumber' => $this->input->post('SenderNumber'),
				));
            redirect('inbox');
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
            core::update('inbox','parksms',array(
				'UpdatedInDB' => $this->input->post('UpdatedInDB'),
				'Text' => $this->input->post('Text'),
				'SenderNumber' => $this->input->post('SenderNumber'),
				),$this->input->post('id'));
            redirect('inbox');
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
        core::delete('inbox','parksms','ID',$id);
        redirect('inbox');
    }


}
