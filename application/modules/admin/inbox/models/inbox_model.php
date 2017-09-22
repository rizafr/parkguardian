<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Inbox_model extends CI_model
{
     function __construct()
    {
        parent::__construct();
    }

     // BUAT METHOD MODEL DI SINI

    // function get_inbox()
    // {
    //     $db = $this->load->database('gammu',TRUE);
    //     $where = array('Processed' => false);
    //     $db->select('*');
    //     $db->where($where);
    //     $query = $db->get('inbox');
    //     return $query;
    // }
}
