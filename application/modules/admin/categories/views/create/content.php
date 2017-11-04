<div class='row-fluid'>
	<div class="span12">

		<?php echo $this->load->view('_layouts/menus');?>   
		<a href="<?php echo base_url('categories');?>" class='btn'><i class='fa fa-angle-left'></i>
		Kembali
		</a>

		<hr>

		<!--START FORM-->
		<form method='POST' charset='UTF-8' action='<?php echo base_url('categories/create');?>' class="form " >

			<!-- start Name -->
			<div class='control-group <?php echo form_error('label') ? 'error' : ''; ?>'>
				<label class='control-label' ><strong>Nama Kategori Laporan</strong></label>
				<div class='controls'>
					<input type='text' name='label' value='<?php echo set_value('label');?>' class='span5' placeholder='Name' required>
					<?php echo form_error('Label'); ?></div>
				</div>
				<!-- end Name -->

				<!--Submit -->
				<div class="control-group ">
					<div class="controls">
						<a href='<?php echo base_url('categories');?>' class="btn"><i class='fa fa-times'></i> Batalkan</a>
						<button data-loading-text="Loading ..." type="submit" class="submit btn btn-primary"><i class="fa fa-location-arrow"></i>Simpan</button>
					</div>
				</div>
				<!--end submit -->

			</form>
			<!--END FORM-->
		</div>
	</div>