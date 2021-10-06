<form action="<?= base_url('home/print_bahan') ;?>" method="POST" enctype="multipart/form-data">
						<div class="input-group mb-3">
						<div class="input-group-prepend">
						<span class="input-group-text">Cari Kas</span>
						</div>
						<input type="month" name="tanggal" class="form-control">
						<input type="submit" class="btn btn-success" name="laporan_print">
					</div>
					</form>