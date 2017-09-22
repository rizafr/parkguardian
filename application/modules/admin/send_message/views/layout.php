<ul class="nav nav-tabs">
    <li class="<?php echo $this->uri->segment(2) == '' ? 'active':'';?>">
        <a href="<?php echo base_url('send_message/');?>">
            Kirim Berdasarkan Kontak Telepon
        </a>
    </li>
    <li class="<?php echo $this->uri->segment(2) == 'send_by_group' ? 'active':'';?>">
        <a href="<?php echo base_url('send_message/send_by_group');?>">
            Kirim Berdasarkan Grup Telepon
        </a>
    </li>
    <li class="<?php echo $this->uri->segment(2) == 'send_by_number' ? 'active':'';?>">
        <a href="<?php echo base_url('send_message/send_by_number');?>">
            Kirim Berdasarkan Nomor Telepon
        </a>
    </li>
    <li class="<?php echo $this->uri->segment(2) == 'send_by_rw' ? 'active':'';?>">
        <a href="<?php echo base_url('send_message/send_by_rw');?>">
            Kirim Berdasarkan RW
        </a>
    </li>
</ul>
<br>
<?php if ($this->session->flashdata('success')) :?>
    <div class="alert alert-success">
        <i class='fa fa-check'></i> Pesan Berhasil Dikirim
    </div>
<?php endif; ?>
