<div class="right_col" role="main">
    <h1 align="center" class="h3 mb-4 text-gray-800"><?= $title; ?></h1>
    <div class="judul" data-judul="<?= $title; ?>"></div>
    <div class="flash-data" data-flashdata="<?= $this->session->flashdata('message'); ?>"></div>
    <?= form_error('menu', '<div class="alert alert-danger" role="alert">', '</div>'); ?>

    <!-- <?= $this->session->flashdata('message'); ?> -->

    <div class="clearfix"></div>

    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                <form action="<?= base_url('owner/print_bahan') ;?>" method="POST" enctype="multipart/form-data">
                        <div class="input-group mb-8">
                        <div class="input-group-prepend">
                        <span class="input-group-text">Cetak laporan Kas</span>
                        </div>
                        <input type="month" name="tanggal" class="form-control">
						<div class="mb-12">
                        <input type="submit" class="btn btn-success" name="laporan_print">
						</div>
                    </div>
                    </form>
                    </div>
            <div class="row" align="center">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <h4 class="mb-3">Laporan Data Pengeluaran</h4>
                        <div class="x_content">
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

                                foreach($bahan as $data) :
                                ?>
                                        <tr>
                                            <td><?= $no++ ;?></td>
                                            <td><?= $data->tgl_pembelian ?></td>
                                            <td><?= $data->nama_bahan ?></td>
                                            <td><?= $data->jumlah ?></td>
                                            <td>Rp. <?= number_format($data->harga);?></td>
                                        

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
        </div>
    </div>
</div>
</div>
</div>
