<?php $inbox = core::get_all('inbox','gammu');?>
<?php $inboxUnread = core::get_where('inbox','gammu',array('newComing' => 1));?>
<?php $sending = core::get_all('sentitems','gammu');?>
<?php $sendingError = core::get_where('sentitems','gammu',array('status' => 'SendingError'));?>
<?php $outbox = core::get_all('outbox','gammu');?>
<?php $phonebook = core::get_all('pbk','gammu');?>
<?php $group = core::get_all('pbk_groups','gammu');?>

 <div class='box'>
    <ul class="nav nav-list">
    <li class="nav-header">Menu</li>
    <li class="<?php echo $this->uri->segment(1) == 'pbk' ? "active" : "";?>"><a href="<?php echo base_url('pbk');?>">Buku Telepon
         <span class="badge"><?php echo $phonebook->num_rows();?></span>
        </a></li>
     <li class="<?php echo $this->uri->segment(1) == 'pbk_group' ? "active" : "";?>"><a href="<?php echo base_url('pbk_group');?>">Grup Telepon
          <span class="badge"><?php echo $group->num_rows();?></span>
         </a></li>
  
    <li class='divider'></li>
    <li class="<?php echo $this->uri->segment(1) == 'send_message' ? "active" : "";?>"><a href="<?php echo base_url('send_message');?>">Kirim Pesan</a></li>
    <li class="<?php echo $this->uri->segment(1) == 'send_broadcast' ? "active" : "";?>"><a href="<?php echo base_url('send_broadcast');?>">Kirim Pesan Massal</a></li>
    <li class='divider'></li> 
   
    <li class="<?php echo $this->uri->segment(1) == 'inbox' ? "active" : "";?>"><a href="<?php echo base_url('inbox');?>">Pesan Masuk  	
         <span class="badge"><?php echo $inbox->num_rows();?></span>
         <?php if($inboxUnread->num_rows() > 0) { ?>
         <span class="label label-important"><?php echo $inboxUnread->num_rows();?> Pesan Belum Dibaca</span>
         <?php } ?>
        </a></li>
         <li class="<?php echo $this->uri->segment(1) == 'outbox' ? "active" : "";?>"><a href="<?php echo base_url('outbox');?>">Pesan Keluar
             <?php if($outbox->num_rows() > 0) { ?>
             <span class="badge"><?php echo $outbox->num_rows();?></span>
             <?php } ?>
         </a></li>
         </a></li>
    <li class="<?php echo $this->uri->segment(1) == 'sending' ? "active" : "";?>"><a href="<?php echo base_url('sending');?>">
            Pesan Terkirim
         <span class="badge"><?php echo $sending->num_rows();?></span>
         <?php if($sendingError->num_rows() > 0) { ?>
             <span class="label label-important"><?php echo $sendingError->num_rows();?> Gagal</span>
             <?php } ?>
        </a></li>
        </a></li>
    <li class='divider'></li>
    <li class="<?php echo $this->uri->segment(1) == 'admin' ? "active" : "";?>"><a href="<?php echo base_url('admin');?>">Admin</a></li>
    </ul>
 </div>