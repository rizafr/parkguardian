<legend>Kirim Pesan Berdasarkan Nomor Telepon</legend>

<?php include('layout.php');?>

<form method='POST' action='<?php echo base_url('send_message/send_by_number');?>' charset='UTF-8'>

    <label>Isi Nomor Telepon</label>

    <input type='text' name='phone'>
    <?php echo form_error('phone');?>

    <label>Jumlah Pengiriman</label>
    <select name='total'>
        <?php for($i = 1;$i < 11;$i++) { ?>
        <option value='<?php echo $i;?>'><?php echo $i;?></option>
        <?php } ?>
    </select>
    <label>Isi Pesan</label>

    <textarea id='message' class='span9' style='height:200px;' name='message' placeholder='message'><?php echo set_value('message');?></textarea>
    <?php echo form_error('message');?>

    <hr>
    <input type="reset"  value="Reset" class='btn'>
    <input type="submit" class='btn btn-primary' value="Kirim Pesan">

</form>

<script src="<?php echo base_url();?>assets/plugin/count-textarea/count-textarea.js"></script>              
<script>
    var options = {
        'maxCharacterSize': 160,
        'originalStyle': 'originalDisplayInfo',
        'warningStyle': 'warningDisplayInfo',
        'warningNumber': 40,
        'displayFormat': '#input Characters | #left Characters Left | #words Words'
    };
    $('#message').textareaCount(options);

</script>