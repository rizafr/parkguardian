<div class='row-fluid'>
	<div class="span12">
		<?php echo $this->load->view('_layouts/menus');?>

		<table class='table table-striped table-bordered table-hover table-condensed'>
			<tbody><?php foreach (core::get_where('pbk','gammu',array('id' => $this->uri->segment(3)),1)->result() as $row) { ; ?>
				<tr>
					<td>ID</td>
					<td><?php echo $row->ID;?></td>
				</tr>
				<tr>
					<td>Grup</td>
					<td><?php echo $row->GroupID;?></td>
				</tr>
				<tr>
				<td>Nama</td>
					<td><?php echo $row->Name;?></td>
				</tr>
				<tr>
				<td>Number</td>
					<td><?php echo $row->Number;?></td>
				</tr>
				<td>RW</td>
					<td><?php echo $row->RwNumber;?></td>
				</tr>
				<td>Status</td>
					<td><?php echo $row->Status;?></td>
				</tr>
				<td>Umur</td>
					<td><?php echo $row->Birth;?></td>
				</tr>
				<?php } ?>
			</tbody>
		</table>
	</div>
</div>