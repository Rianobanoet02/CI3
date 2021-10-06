
<head>
    <!-- Bootstrap -->
    <link href="<?= base_url('assets/backend/'); ?>vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Datatables -->
    <link href="<?= base_url('assets/backend/'); ?>vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="<?= base_url('assets/backend/'); ?>vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="<?= base_url('assets/backend/'); ?>vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="<?= base_url('assets/backend/'); ?>vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="<?= base_url('assets/backend/'); ?>vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">

    <script src="<?= base_url('assets/backend/'); ?>vendors/jquery/dist/jquery-3.3.1.js"></script>

    <link href="<?= base_url('assets/css/'); ?>morris.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <!--<link href="<?= base_url('assets/backend/'); ?>build/css/custom.min.css" rel="stylesheet">-->
    <link href="<?= base_url('assets/backend/'); ?>build/css/jquery-ui.css" rel="stylesheet">
</head>
<div class="clearfix"></div>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
    <div class="container">
        <center>
            <h1><b>Laporan Perbulan</b></h1>
            <hr>
        </center>
        <table id="order_data" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Tanggal</th>
                                        <th>Nama Bahan</th>
                                        <th>Jumlah Barang</th>
                                        <th>Harga</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <?php  
                                $no=1; 

                                foreach($bahan as $datas) :
                                ?>
                                        <tr>
                                            <td><?= $no++ ;?></td>
                                            <td><?= $datas->tgl_pembelian?></td>
                                            <td><?= $datas->nama_bahan ?></td>
                                            <td><?= $datas->jumlah ?></td>
                                            <td>Rp. <?= number_format($datas->harga);?></td>
                                        

                                    <?php endforeach ;?>
                                    </tr>

                                </tbody>
                                <tr>
                                    <th colspan="4"><center><h2>Total</h2></center></th>

                                    <td colspan="2"><b><h2>Rp.<?= number_format($sum) ;?></h2></b></td>
                                </tr>
                            </table>
    </div>  
    </div>
</div>
</div>
<script>
    window.print();
</script>
<script src="<?= base_url('assets/backend/'); ?>vendors/DateJS/build/date.js"></script>
