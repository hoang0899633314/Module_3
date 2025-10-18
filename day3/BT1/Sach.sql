use day3;

create table tac_gia(
id_tac_gia int primary key auto_increment,
ten varchar(255) not null
);

create table sach(
id_sach int primary key auto_increment,
ten varchar(255) not null,
gia decimal(10,2) not null,
id_tac_gia int,
foreign key (id_tac_gia) references tac_gia(id_tac_gia)
);

create table nhan_vien(
id_nhan_vien int primary key auto_increment,
ten varchar(255) not null,
dia_chi text not null
);

create table nhan_vien_ban_sach(
id_nhan_vien int,
id_sach int,
primary key (id_nhan_vien, id_sach),
foreign key (id_nhan_vien) references nhan_vien(id_nhan_vien),
foreign key (id_sach) references sach(id_sach)
);