<div class='row-fluid'>
    <div class="span12">

        <?php echo $this->load->view('_layouts/menus');?>   
        <a href='<?php echo base_url('subcategories');?>' class='btn'><i class='fa fa-angle-double-left'></i> 
            Kembali
        </a>
        <br><hr>
        <!--START FORM-->
        <form method='POST' charset='UTF-8' action='<?php echo base_url('subcategories/update').'/'.$this->uri->segment(3);?>' class="form" >

            <?php $query = core::get_where('subcategories','parksms',array('idsubcategories' => $this->uri->segment(3)),1); ?>
            <?php $row = $query->row_array();?>
            <input type='hidden' name='idsubcategories' value='<?php echo $row['idsubcategories'];?>' >

            <!-- start Category -->
            <div class='control-group <?php echo form_error('idcategories') ? 'error' : ''; ?>'>
                <label class='control-label' ><strong>Kategori</strong></label>
                <div class='controls'>
                    <?php $category = core::get_all('categories','parksms', 'idcategories');?>
                    <select name='idcategories' class='span5'>
                        <option value='0'>Pilih Kategori</option>
                        <?php foreach($category->result() as $rows) { ?>
                        <option value='<?php echo $rows->idcategories;?>' <?php echo $row['idcategories'] == $rows->idcategories ? "selected" : "";?>><?php echo $rows->label;?></option>
                        <?php } ?>
                    </select>
                    <?php echo form_error('idpbk_groups'); ?>
                </div>
            </div>
            <!-- end GroupID -->

            <!-- start GroupID -->
            <div class='control-group <?php echo form_error('idpbk_groups') ? 'error' : ''; ?>'>
                <label class='control-label' ><strong>Group</strong></label>
                <div class='controls'>
                    <?php $group = core::get_all('pbk_groups','parksms');?>
                    <select name='idpbk_groups' class='span5'>
                        <option value='0'>Pilih Grup</option>
                        <?php foreach($group->result() as $rows) { ?>
                        <option value='<?php echo $rows->ID;?>' <?php echo $row['idpbk_groups'] == $rows->ID ? "selected" : "";?>><?php echo $rows->Name;?></option>
                        <?php } ?>
                    </select>
                    <?php echo form_error('idpbk_groups'); ?>
                </div>
            </div>
            <!-- end GroupID -->

            <!-- start Code -->
            <div class='control-group <?php echo form_error('code') ? 'error' : ''; ?>'>
                <label class='control-label' ><strong>Kode</strong></label>
                <div class='controls'>
                    <input type='text' name='code' class='span5'  placeholder='Kode' value='<?php echo $row['code'];?>' required>
                    <?php echo form_error('code'); ?>
                </div>
            </div>
            <!-- end Code -->

            <!-- start Label -->
            <div class='control-group <?php echo form_error('code') ? 'error' : ''; ?>'>
                <label class='control-label' ><strong>Label</strong></label>
                <div class='controls'>
                    <input type='text' name='label' class='span5'  placeholder='Label' value='<?php echo $row['label'];?>' required>
                    <?php echo form_error('label'); ?>
                </div>
            </div>
            <!-- end Label -->


            <!--Submit -->
            <div class="control-group ">
                <div class="controls">
                    <a href='<?php echo base_url('subcategories');?>' class="btn"><i class='fa fa-times'></i>
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