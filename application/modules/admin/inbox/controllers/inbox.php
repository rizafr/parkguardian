<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Inbox extends Admincore
{
    const REGISTER = 1;
    const UPDATE = 2;
    const PASIEN = 1;
    const KADER = 2;

    function __construct()
    {
        parent::__construct();
        $this->load->model('inbox_model','model');
        core::update_where('inbox','gammu',array('newComing' => 0),'newComing',1);
    }

    /* METHOD "READ"
     * berfungsi untuk membaca query dari database dengan system pagination
     */
    function index()
    {
        $getInbox = $this->model->get_inbox();
        if($getInbox) {
          foreach ($getInbox as $keys => $values) {
            $this->smsreg($values);
          }
        }
        $data['include'] =   $this->load->view('/read/include','',TRUE);
        $data['content'] =   $this->load->view('/read/content',$data,TRUE);
        $this->load->view("admin/main",$data);
    }

    private function smsreg($data)
    {
        $sender = $data['SenderNumber'];
        $content = strtoupper($data['TextDecoded']);
        $smsID = $data['ID'];

        $split = explode(" ", $content);
        $command = $split[0];
        if (count($split) > 2) {
            $repliedText = "Maaf FORMAT REGISTRASI SALAH, mohon periksa dan ulangi registrasi";
            $this->replayedSMS($sender, $repliedText);
        } else {
          if ($command == "REG") {
              $content = explode("#", $split[1]);
              if (count($content) < 3 || count($content) > 5) {
                  $repliedText = "Maaf FORMAT REGISTRASI SALAH, mohon periksa dan ulangi registrasi";
                  $this->replayedSMS($sender, $repliedText);
              } else {
                  if (count($content) === 5) {
                      if ($content[0] === 'PASIEN') $group = self::PASIEN;
                      if ($content[0] === 'KADER') $group = self::KADER;
                      $this->registerNewUser($sender, $group, $content);
                  } else {
                      $repliedText = "Maaf FORMAT REGISTRASI SALAH, mohon periksa dan ulangi registrasi";
                      $this->replayedSMS($sender, $repliedText);
                  }                        
              }
          }
        }
    }

    private function registerNewUser($sender, $group, $content)
    {
        $isExist = $this->model->exist_user($sender);
        if (!empty($isExist)) {
            $repliedText = "Maaf, notelp ".$sender." telah terdaftar sebelumnya atas nama " . $isExist->Name;
            $this->replayedSMS($sender, $repliedText);
        } else {
            // $datasource = $this->structedSource(self::REGISTER, $type, $sender, $arrayContent);
            // $query2 = "INSERT INTO pbk (GroupID, Name, Number) VALUES ('$idgroup', '$nama', '$noHP')";
            // mysql_query($query2);
            // $tbl,$database,$arr
            $data = array(
              'GroupID' => $group,
              'Name' => $content[1],
              'RwNumber' => $content[2],
              'Status' => $content[3],
              'Birth' => $content[4],
            );
            $isSaved = $this->model->insert('pbk', 'gammu', $data);
            if($isSaved) {
                if($group == self::PASIEN) $type = 'PASIEN';
                if($group == self::KADER) $type = 'KADER';
                $repliedText = "Terima kasih, Sdr. ".$datasource['name']." telah terdaftar sebagai ".$type;
                $this->replayedSMS($sender, $repliedText);
                return;
            }
            $repliedText = "Maaf, Sdr. ".$datasource['name']." GAGAL tersimpan, silahkan coba lagi";
            $this->replayedSMS($sender, $repliedText);
        }
    }

    private function replayedSMS($sender, $message, $smsID)
    {
        core::insert('outbox','gammu',array(
          'DestinationNumber' => $sender,
          'TextDecoded' => $message,
        ));
        core::response($sender, $message);
        $query = "UPDATE inbox SET Processed = 'true' WHERE ID = '$smsID'";
        mysql_query($query);
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
            core::insert('inbox','gammu',array(
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
            core::update('inbox','gammu',array(
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
        core::delete('inbox','gammu','ID',$id);
        redirect('inbox');
    }


}
