<div class='row-fluid'>
	<div class="span12">

		<?php echo $this->load->view('_layouts/menus');?>   
		<a href="<?php echo base_url('pbk_group');?>" class='btn'><i class='fa fa-angle-left'></i>
			Kembali
		</a>

		<hr>
		<!--START FORM-->
		<form method='POST' charset='UTF-8' action='<?php echo base_url('pbk_group/update').'/'.$this->uri->segment(3);?>' class="form" >

			<?php $query = core::get_where('pbk_groups','parksms',array('id' => $this->uri->segment(3)),1); ?>
			<?php $row = $query->row_array();?>
			<input type='hidden' name='id' value='<?php echo $row['ID'];?>' >
			<!-- start Name -->
			<div class='control-group <?php echo form_error('Name') ? 'error' : ''; ?>'>
				<label class='control-label' ><strong>Nama</strong></label>
				<div class='controls'>
					<input type='text' name='Name' class='span5' value='<?php echo $row['Name'];?>' placeholder='Name' required>
					<?php echo form_error('Name'); ?>
				</div>
			</div>
			<!-- end Name -->
			<!-- start Phone -->
			<div class='control-group <?php echo form_error('phone') ? 'error' : ''; ?>'>
				<label class='control-label' ><strong>Telepon</strong></label>
				<div class='controls'>
					<input type='text' name='phone' class='span5' value='<?php echo $row['phone'];?>' placeholder='Telepon' required>
					<?php echo form_error('phone'); ?>
				</div>
			</div>
			<!-- end Name -->

			<!--Submit -->
			<div class="control-group ">
				<div class="controls">
					<a href='<?php echo base_url('pbk_group');?>' class="btn"><i class='fa fa-times'></i> Cancel</a>
					<button data-loading-text="Loading ..." type="submit" class="submit btn btn-warning"><i class='fa fa-edit'></i>Ubah</button>
				</div>
			</div>
			<!--end submit -->

		</form>
		<!--END FORM-->
	</div>
</div>