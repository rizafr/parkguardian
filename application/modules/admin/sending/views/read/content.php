<div class='row-fluid'>
    <div class="span12">

        <?php echo $this->load->view('_layouts/menus');?>

        <div class="input-prepend input-append">
            <form action='<?php echo base_url('sending/search');?>' method='get'>
                <input class="span9" type="text" name='search'>                   
                <select name='search_by' style='width:100px;'>
                    <option value='DestinationNumber' >Telepon</option>
                </select>
                <button class="btn" type="submit">Cari</button>
            </form>
        </div>

        <select class="span2  pull-right" onchange="location = this.options[this.selectedIndex].value;">
            <option selected='selected' disabled='disabled'>Pilih Rows</option>
            <option value="<?php echo base_url('sending/index/rows/25');?>">25 Rows</option>
            <option value="<?php echo base_url('sending/index/rows/50');?>">50 Rows</option>
            <option value="<?php echo base_url('sending/index/rows/75');?>">75 Rows</option>
            <option value="<?php echo base_url('sending/index/rows/100');?>">100 Rows</option>
            <option value="<?php echo base_url('sending/index/rows/200');?>">200 Rows</option>
        </select>


        <?php
        if($this->uri->segment(3) == 'rows'){
            $per_page = $this->uri->segment(4);
            $segment  = 5;
            $url      = 'sending/index/rows/'.$this->uri->segment(4).'/';
        }else{
            $per_page = 25;
            $segment  = 3;
            $url      = 'sending/index';
        }
        ?>

        <div class='table-responsive margin-table'>
            <table class='table'>
                <caption class='text-right'>
                    <?php $num_rows = core::get_all('sentitems','parksms')->num_rows();?>
                    <small>Total data : <u class='text-error'><?php echo $num_rows;?></u></small>
                </caption><thead>
                <tr>
                    <th style='width:20px;'>#</th>
                    <th>Ke</th>
                    <th>Isi Pesan</th>
                    <th>Tanggal</th>
                    <th>Status</th>
                    <th style='text-align:center;width:100px;'>Aksi</th>
                </tr></thead>
                <tbody>
                    <?php $i = $this->uri->segment($segment) + 1;?>
                    <?php foreach(core::get_all_pagination('sentitems','parksms',$per_page,$segment,$url)->result() as $row): { ?><tr>
                        <td><?php echo $i;?></td>

                        <td><?php echo $row->DestinationNumber ;?></td>
                        <td><?php echo character_limiter($row->TextDecoded,25) ;?></td>
                        <td><?php echo $row->SendingDateTime ;?></td>
                        <td><?php echo $row->Status == "SendingOKNoReport" ? "Success":"Failed" ;?></td>
                        <td>
                            <center><div class='btn-group' >
                                <a href='<?php echo base_url();?>sending/delete/<?php echo $row->ID;?>' class='btn btn-small' data-confirm='Hapus data ini?'><i class='text-error fa fa-trash-o'></i></a>
                                <a href='<?php echo base_url();?>sending/detail/<?php echo $row->ID;?>' class='btn btn-small'><i class='text-info fa fa-weibo'></i></a>
                            </div></center>
                        </td>

                    </tr>
                    <?php } ?>
                    <?php $i++;?>
                <?php endforeach;?>
            </tbody>
        </table>
        </div>

    <?php echo $this->pagination->create_links(); ?>
</div>
</div>
<script type='text/javascript'>
    $(function(){
        $("[data-confirm]").on("click submit", function(){
            return confirm($(this).data("confirm"));
        }); 
    });
</script>
