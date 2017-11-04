<div class='row-fluid'>
    <div class="span12">
        <?php echo $this->load->view('_layouts/menus');?>
        <a href='<?php echo base_url('subcategories');?>' class='btn'><i class='fa fa-angle-double-left'></i> 
            Kembali
        </a>
        <br><hr>
        Jumlah Baris : 
        <select onchange="location = this.options[this.selectedIndex].value;">
            <option selected='selected' disabled='disabled'> Pilih</option>
            <?php for($a = 1;$a <= 25;$a++){ ?>

            <option value="<?php echo base_url('subcategories/create/');?>/<?php echo $a;?>" <?php echo $this->uri->segment(3) == $a ? "selected" : "";?>><?php echo $a;?></option>
            <?php } ?>
        </select>
        <hr>
        <form method='POST' action='' charset='UTF-8'>
            <div class="controls controls-row">
                <div style='width:0px;' class='span1'>#</div>
                <div class='span2'>Kategori</div>
                <div class='span2'>Kode</div>
                <div class='span2'>Label</div>
                <div class='span2'>Grup</div>
            </div>
            <?php $param = $this->uri->segment(3) == '' ? '1' :  $this->uri->segment(3)  ; ?>
            <?php for($i = 1;$i <= $param;$i++){ ?>

            <div class="controls controls-row">
                <div class='span1' style='width:0px;'><?php echo $i;?></div>
                <select name='x[<?php echo $i;?>][category]' class="span2">
                    <option>Pilih Kategori</option>
                    <?php $query = core::get_all('categories','parksms', 'idcategories');?>
                    <?php foreach($query->result() as $row){?>
                    <option value='<?php echo $row->idcategories;?>'><?php echo $row->label;?></option>
                    <?php } ?>
                </select>
                <input type="text" class="span2" value='<?php echo set_value("x[$i][code]");?>' name='x[<?php echo $i;?>][code]' placeholder="Kode ..">
                <input type="text" class="span2" value='<?php echo set_value("x[$i][label]");?>' name='x[<?php echo $i;?>][label]' placeholder="Label ..">
                <select name='x[<?php echo $i;?>][group]' class="span2">
                    <option>Pilih Grup</option>
                    <?php $query = core::get_all('pbk_groups','parksms');?>
                    <?php foreach($query->result() as $row){?>
                    <option value='<?php echo $row->ID;?>'><?php echo $row->Name;?></option>
                    <?php } ?>
                </select>

            </div>

            <div class="controls controls-row">
                <div class='span1' style='width:0px;' ></div>
                <div class='span2'><?php echo form_error("x[$i][category]");?></div>
                <div class='span2'><?php echo form_error("x[$i][code]");?></div>
                <div class='span2'><?php echo form_error("x[$i][label]");?></div>
                <div class='span2'><?php echo form_error("x[$i][group]");?></div>
            </div>
            <?php } ?>
            <hr>

            <input type="submit" class='btn btn-primary' value="Simpan Sub Kategori">

        </form>
    </div></div>