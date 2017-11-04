<div class='row-fluid'>
    <div class="span12">

        <?php echo $this->load->view('_layouts/menus');?>   
        <a href='<?php echo base_url('pbk');?>' class='btn'><i class='fa fa-angle-double-left'></i> 
            Kembali
        </a>
        <br><hr>
        <!--START FORM-->
        <form method='POST' charset='UTF-8' action='<?php echo base_url('pbk/update').'/'.$this->uri->segment(3);?>' class="form" >

            <?php $query = core::get_where('pbk','parksms',array('ID' => $this->uri->segment(3)),1); ?>
            <?php $row = $query->row_array();?>
            <input type='hidden' name='id' value='<?php echo $row['ID'];?>' >

            <!-- start Name -->
            <div class='control-group <?php echo form_error('Name') ? 'error' : ''; ?>'>
                <label class='control-label' ><strong>Nama</strong></label>
                <div class='controls'>
                    <input type='text' name='Name' class='span5'  placeholder='Nama' value='<?php echo $row['Name'];?>' required>
                    <?php echo form_error('Name'); ?>
                </div>
            </div>
            <!-- end Name -->

            <!-- start Number -->
            <div class='control-group <?php echo form_error('Number') ? 'error' : ''; ?>'>
                <label class='control-label' ><strong>Telepon</strong></label>
                <div class='controls'>
                    <input type='text' name='Number' class='span5'  placeholder='Number' value='<?php echo $row['Number'];?>'  required>
                    <?php echo form_error('Number'); ?>
                </div>
            </div>
            <!-- end Number -->

            <!-- start GroupID -->
            <div class='control-group <?php echo form_error('GroupID') ? 'error' : ''; ?>'>
                <label class='control-label' ><strong>Group</strong></label>
                <div class='controls'>
                    <?php $group = core::get_all('subcategories','parksms', 'subcategories');?>
                    <select name='GroupID' class='span5'>
                        <option value='0'>Pilih Kategori</option>
                        <?php foreach($group->result() as $rows) { ?>
                        <option value='<?php echo $rows->idsubcategories;?>' <?php echo $row['GroupID'] == $rows->idsubcategories ? "selected" : "";?>><?php echo $rows->label;?></option>
                        <?php } ?>
                    </select>
                    <?php echo form_error('GroupID'); ?>
                </div>
            </div>
            <!-- end GroupID -->

            <!-- start RtNumber -->
            <div class='control-group <?php echo form_error('RtNumber') ? 'error' : ''; ?>'>
                <label class='control-label' ><strong>RT</strong></label>
                <div class='controls'>
                    <input type='text' name='RtNumber' class='span5'  placeholder='RT' value='<?php echo $row['RtNumber'];?>'  required>
                    <?php echo form_error('RtNumber'); ?>
                </div>
            </div>
            <!-- end RtNumber -->

            <!-- start RwNumber -->
            <div class='control-group <?php echo form_error('RwNumber') ? 'error' : ''; ?>'>
                <label class='control-label' ><strong>RW</strong></label>
                <div class='controls'>
                    <input type='text' name='RwNumber' class='span5'  placeholder='RW' value='<?php echo $row['RwNumber'];?>'  required>
                    <?php echo form_error('RwNumber'); ?>
                </div>
            </div>
            <!-- end RtNumber -->

            <!-- start suspect -->
            <div class='control-group <?php echo form_error('suspect') ? 'error' : ''; ?>'>
                <label class='control-label' ><strong>Keterangan</strong></label>
                <div class='controls'>
                    <input type='text' name='suspect' class='span5'  placeholder='Keterangan' value='<?php echo $row['suspect'];?>'  required>
                    <?php echo form_error('suspect'); ?>
                </div>
            </div>
            <!-- end RtNumber -->

            <!--Submit -->
            <div class="control-group ">
                <div class="controls">
                    <a href='<?php echo base_url('pbk');?>' class="btn"><i class='fa fa-times'></i>
                        Batalkan
                    </a>
                    <button data-loading-text="Loading ..." type="submit" class="submit btn btn-warning"><i class='fa fa-edit'></i>
                        Ubah
                    </button>
                </div>
            </div>
            <!--end submit -->

        </form>
        <!--END FORM-->
    </div>
</div>