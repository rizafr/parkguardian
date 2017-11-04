<div class='row-fluid'>
    <div class="span12">
        <?php echo $this->load->view('_layouts/menus');?>
        <a href='<?php echo base_url('pbk');?>' class='btn'><i class='fa fa-angle-double-left'></i> 
            Kembali
        </a>
        <br><hr>
        Jumlah Baris : 
        <select onchange="location = this.options[this.selectedIndex].value;">
            <option selected='selected' disabled='disabled'> Pilih</option>
            <?php for($a = 1;$a <= 25;$a++){ ?>

            <option value="<?php echo base_url('pbk/create/');?>/<?php echo $a;?>" <?php echo $this->uri->segment(3) == $a ? "selected" : "";?>><?php echo $a;?></option>
            <?php } ?>
        </select>
        <hr>
        <form method='POST' action='' charset='UTF-8'>
            <div class="controls controls-row">
                <div style='width:0px;' class='span1'>#</div>
                <div class='span2'>Nama</div>
                <div class='span2'>Telepon</div>
                <div class='span2'>Grup</div>
                <div class='span1'>RT</div>
                <div class='span1'>RW</div>
                <div class='span2'>Keterangan</div>
            </div>
            <?php $param = $this->uri->segment(3) == '' ? '1' :  $this->uri->segment(3)  ; ?>
            <?php for($i = 1;$i <= $param;$i++){ ?>

            <div class="controls controls-row">
                <div class='span1' style='width:0px;'><?php echo $i;?></div>
                <input type="text" class="span2" value='<?php echo set_value("x[$i][name]");?>' name='x[<?php echo $i;?>][name]' placeholder="Name ..">
                <input type="text" class="span2" value='<?php echo set_value("x[$i][phone]");?>' name='x[<?php echo $i;?>][phone]' placeholder="No Telephone ..">
                <select name='x[<?php echo $i;?>][group]' class="span2">
                    <option>Pilih Kategori</option>
                    <?php $query = core::get_all('subcategories','parksms', 'idsubcategories');?>
                    <?php foreach($query->result() as $row){?>
                    <option value='<?php echo $row->idsubcategories;?>'><?php echo $row->label;?></option>
                    <?php } ?>
                </select>
                <input type="text" class="span1" value='<?php echo set_value("x[$i][RtNumber]");?>' name='x[<?php echo $i;?>][RtNumber]' placeholder="RT ..">
                <input type="text" class="span1" value='<?php echo set_value("x[$i][RwNumber]");?>' name='x[<?php echo $i;?>][RwNumber]' placeholder="RW ..">
                <input type="text" class="span2" value='<?php echo set_value("x[$i][suspect]");?>' name='x[<?php echo $i;?>][suspect]' placeholder="Keterangan ..">

            </div>

            <div class="controls controls-row">
                <div class='span1' style='width:0px;' ></div>
                <div class='span2'><?php echo form_error("x[$i][name]");?></div>
                <div class='span2'><?php echo form_error("x[$i][phone]");?></div>
                <div class='span2'><?php echo form_error("x[$i][group]");?></div>
                <div class='span2'><?php echo form_error("x[$i][RwNumber]");?></div>
                <div class='span2'><?php echo form_error("x[$i][RtNumber]");?></div>
                <div class='span2'><?php echo form_error("x[$i][suspect]");?></div>
            </div>
            <?php } ?>
            <hr>

            <input type="submit" class='btn btn-primary' value="Simpan Kontak">

        </form>
    </div></div>