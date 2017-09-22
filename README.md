# SIMLAPER

User
- Pasien
- Kader
- Admin

Format SMS
- Pagi : *Apakah Anda sudah minum obat?*
- Siang : *Minumlah obat dengan teratur.*

format registrasi :
`nama` => string
`no_rw` => integer (misal : RW02 = `2`)
`status` => integer
------------------
`umur` => integer
------------------
kader : REG `nama`#`no_rw`#`status`
pasien : REG `nama`#`no_rw`#`status`#`umur`

kirim ke No tujuan (SMS Center)

format broadcast :
dari sms :
LAP `no_rw`#`message`

dari admin :

controller : servicesms/broadcast function
GET['sender']
GET['content'] => `no_rw`#`message`

Dikirim per RW untuk setiap pasien

Alur:
- Reg Pasien
- Reg Kader
- Kirim Pesan
