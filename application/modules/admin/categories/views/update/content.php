	<div class='row-fluid'>
		<div class="span12">

			<?php echo $this->load->view('_layouts/menus');?>   
			<a href="<?php echo base_url('categories');?>" class='btn'><i class='fa fa-angle-left'></i>
				Kembali
			</a>

			<hr>
			<!--START FORM-->
			<form method='POST' charset='UTF-8' action='<?php echo base_url('categories/update').'/'.$this->uri->segment(3);?>' class="form" >

				<?php $query = core::get_where('categories','parksms',array('idcategories' => $this->uri->segment(3)),1); ?>
				<?php $row = $query->row_array();?>
				<input type='hidden' name='idcategories' value='<?php echo $row['idcategories'];?>' >
				<!-- start Name -->
				<div class='control-group <?php echo form_error('label') ? 'error' : ''; ?>'>
					<label class='control-label' ><strong>Nama</strong></label>
					<div class='controls'>
						<input type='text' name='label' class='span5' value='<?php echo $row['label'];?>' placeholder='Name' required>
						<?php echo form_error('label'); ?></div>
					</div>
					<!-- end Name -->

					<!--Submit -->
					<div class="control-group ">
						<div class="controls">
							<a href='<?php echo base_url('categories');?>' class="btn"><i class='fa fa-times'></i> Cancel</a>
							<button data-loading-text="Loading ..." type="submit" class="submit btn btn-warning"><i class='fa fa-edit'></i>Ubah</button>
						</div>
					</div>
					<!--end submit -->

				</form>
				<!--END FORM-->
			</div>
		</div>