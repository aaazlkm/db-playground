select count(*) from shohin;

select count(*), count(siire_tanka) from shohin;

select sum(hanbai_tanka), sum(siire_tanka) from shohin;
select avg(hanbai_tanka), avg(siire_tanka) from shohin;

select max(shohin_mei), max(torokubi), min(torokubi) from shohin;

select count(distinct siire_tanka), count(siire_tanka) from shohin;
select distinct count(siire_tanka), count(siire_tanka) from shohin;

select siire_tanka as st, count(*) from shohin GROUP BY st;

select distinct count(siire_tanka), count(siire_tanka) from shohin where siire_tanka > 500;

select shohin_bunrui, count(*) from shohin where siire_tanka > 500 GROUP BY shohin_bunrui;

select shohin_bunrui, count(*) from shohin GROUP BY shohin_bunrui having count(*) > 2;
select shohin_bunrui, count() from shohin GROUP BY shohin_bunrui;

select shohin_bunrui, count(shohin_bunrui) from shohin GROUP BY shohin_bunrui having shohin_bunrui = 'ihuku';
select shohin_bunrui, count(shohin_bunrui) from shohin where shohin_bunrui = 'ihuku' GROUP BY shohin_bunrui;

select * from shohin order by siire_tanka ASC;
select * from shohin order by hanbai_tanka DESC;

select * from shohin order by hanbai_tanka DESC, shohin_id ASC;

select * from shohin order by hanbai_tanka DESC;
select * from shohin order by 4 DESC;

select shohin_bunrui, sum(hanbai_tanka), sum(siire_tanka) from shohin group by shohin_bunrui having sum(hanbai_tanka) > 1.5 * sum(siire_tanka);

select * from shohin order by torokubi DESC, hanbai_tanka ASC,

create table ShohinIns(
  shohin_id integer not null,
  shohin_mei varchar(100) not null,
  shohin_bunrui varchar(32) not null,
  hanbai_tanka INTEGER default 0,
  siire_tabka integer,
  torokubi date,
  primary key (shohin_id)
);

select * from ShohinIns;
insert into ShohinIns (shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, siire_tabka, torokubi) values (1, '', '', 0, 0, '2022-2-2');
alter table ShohinIns rename column siire_tabka to siire_tanka;

drop table ShohinIns;

create table ShohinIns(
  shohin_id char(4) not null,
  shohin_mei varchar(100) not null,
  shohin_bunrui varchar(32) not null,
  hanbai_tanka INTEGER default 0,
  siire_tanka integer,
  torokubi date,
  primary key (shohin_id)
);

select * from ShohinIns;
insert into ShohinIns (shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, siire_tanka, torokubi) values ('0001', 'Tシャツ', '衣服', 1000, 500, '2022-2-2');

use shop;
select * from ShohinIns;

insert into ShohinIns (shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, siire_tanka, torokubi) values ('0002', 'アウター', '衣服', 5000, 400, '2022-2-3');
insert into ShohinIns (shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, siire_tanka, torokubi) values ('0003', 'アウター', '衣服', 5000, 400, '2022-2-3');
insert into ShohinIns values ('000３', 'コート', '衣服', 1000, 8000, '2022-2-3');
insert into ShohinIns values ('0004', 'コート', '衣服', default, null, '2022-2-3');
delete from ShohinIns where shohin_id = '1';

create table ShohinCopy(
  shohin_id char(4) not null,
  shohin_mei varchar(100) not null,
  shohin_bunrui varchar(32) not null,
  hanbai_tanka INTEGER default 0,
  siire_tanka integer,
  torokubi date,
  primary key (shohin_id)
);

select * from ShohinCopy;

insert into ShohinCopy select * from ShohinIns;

insert into ShohinCopy (shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, siire_tanka, torokubi)
 select shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, siire_tanka, torokubi
 from ShohinIns
 where shohin_id = '0003';

delete from ShohinCopy where shohin_id = '0003';

drop table ShohinCopy;

delete from ShohinIns where true;

select * from ShohinIns;
Insert Into ShohinIns (shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, siire_tanka, torokubi) VALUES
('0001', 'Tシャツ', '衣服', 1500, 750, '2023-01-01'),
('0002', 'ジーンズ', '衣服', 2500, 1250, '2023-01-02'),
('0003', 'エプロン', 'キッチン用品', 1000, 500, '2023-01-03'),
('0004', '包丁セット', 'キッチン用品', 3000, 1500, '2023-01-04'),
('0005', '電子レンジ', '電気用品', 5000, 2500, '2023-01-05'),
('0006', '電気ポット', '電気用品', 4000, 2000, '2023-01-06'),
('0007', 'フライパン', 'キッチン用品', 2000, 1000, '2023-01-07'),
('0008', 'セーター', '衣服', 3000, 1500, '2023-01-08'),
('0009', 'トースター', '電気用品', 3500, 1750, '2023-01-09'),
('0010', 'ハンドブレンダー', 'キッチン用品', 2500, 1250, '2023-01-10');

select * from ShohinIns;

create table ShohinBunrui (
  shohin_burui varchar(32) not null,
  sum_hanbai_tanka integer not null,
  sum_siire_tanka integer not null,
  primary key (shohin_burui)
);

select * from ShohinBunrui;

insert into ShohinBunrui
select shohin_bunrui, sum(hanbai_tanka), sum(siire_tanka)
from ShohinIns
group by shohin_bunrui;

select * from ShohinBunrui;

select * from ShohinIns;
delete from ShohinIns where shohin_id = '0001';
delete from ShohinIns;

truncate ShohinIns;

update ShohinIns set torokubi = '2023-02-02';

update ShohinIns set hanbai_tanka = hanbai_tanka * 10 where shohin_bunrui = 'キッチン用品';

update ShohinIns set hanbai_tanka = null where shohin_bunrui = 'キッチン用品';
update ShohinIns set hanbai_tanka = 1000 where shohin_bunrui = 'キッチン用品';

update ShohinIns
set hanbai_tanka = hanbai_tanka * 10,
  siire_tanka = siire_tanka * 10
where shohin_bunrui = 'キッチン用品';

update ShohinIns
set (hanbai_tanka, siire_tanka) = (hanbai_tanka * 10, siire_tanka * 10)
where shohin_bunrui = 'キッチン用品';

Start Transaction;

update ShohinIns
set hanbai_tanka = 102
where shohin_bunrui = 'キッチン用品';

update ShohinIns
set shohin_mei = null
where shohin_bunrui = 'キッチン用品';

update ShohinIns
set siire_tanka = 102
where shohin_bunrui = 'キッチン用品';

ROLLBACK;

Commit;


select * from ShohinIns;

create table ShohinSaeki(
  shohin_id char(4) not null,
  shohin_mei varchar(100) not null,
  hanbai_tanka integer,
  siire_tanka integer,
  saeki integer,
  primary key (shohin_id)
)

select * from ShohinSaeki;

insert into ShohinSaeki
  (shohin_id, shohin_mei, hanbai_tanka, siire_tanka, saeki)
 select shohin_id, shohin_mei, hanbai_tanka, siire_tanka, hanbai_tanka - siire_tanka
 from ShohinIns;

update ShohinSaeki
set hanbai_tanka = 4000
where shohin_mei = 'セーター';

 select * from ShohinSaeki;

start transaction;

update ShohinSaeki
set hanbai_tanka = 3000,
  saeki = hanbai_tanka - siire_tanka
where shohin_mei = 'セーター';

commit;

rollback;
