  <?php if($this->session->flashdata('success')){?>

  <div class='alert alert-success'>
      <i class='fa fa-check'></i> Kirim Pesan Massal <?php echo $this->session->flashdata('TotalSend');?> Number

  </div>

  <?php } ?>

  <legend>Kirim Pesan Massal</legend>
  <div class="balloon"><div class='padding20'>
      <form method='POST' action='' charset='UTF-8'>

          <label>Hilangkan centang untuk nomor yang tidak ingin dikirim</label>
          <hr>  <?php $query = core::get_all('pbk','gammu','Name');?>
          Jumlah Nomor Telepon : <?php echo $query->num_rows();?>
          <div style='width:100%;height:300px;overflow:auto;border:1px solid #CCC;padding:10px 0px 10px 10px ;'>

              <?php foreach($query->result() as $row){ ?>
              <?php $group = core::get_where('pbk_groups','gammu',array('ID' => $row->GroupID));?>
              <?php $groups = $group->row();?>
              <label class="checkbox">
                  <input type='checkbox' name='SendNumber[]' value='<?php echo $row->Number;?>' checked> 
                  <?php echo $row->Name;?> (<?php echo $row->Number;?> - <?php echo $group->num_rows() > 0 ? $groups->Name : "No Group";?>)
              </label>

              <?php } ?>
          </div>
          <?php echo form_error('phone');?>
          <br>
          <label>Jumlah Pengiriman</label>

          <select name='total'>
              <?php for($i = 1;$i < 11;$i++) { ?>
              <option value='<?php echo $i;?>'><?php echo $i;?></option>
              <?php } ?>
          </select>

          <br>

          <label>Isi Pesan</label>
          <textarea id='message' class='span12' style='height:200px;' name='message' placeholder='message'><?php echo set_value('message');?></textarea>
          <?php echo form_error('message');?>

          <hr>
          <input type="reset"  value="Reset" class='btn'>
          <input type="submit" class='btn btn-primary' value="Kirim Pesan">

      </form>
  </div> 

  <script src="<?php echo base_url();?>assets/plugin/count-textarea/count-textarea.js"></script>              
  <script>
      var options = {
          'maxCharacterSize': 150,
          'originalStyle': 'originalDisplayInfo',
          'warningStyle': 'warningDisplayInfo',
          'warningNumber': 40,
          'displayFormat': '#input Characters | #left Characters Left | #words Words'
      };
      $('#message').textareaCount(options);

  </script>