select * from ShohinIns;

use shop;

create view burui (shohin_bunrui, sum_hanbai_tanka, sum_siire_tanka)
  as
    select shohin_bunrui, sum(hanbai_tanka), sum(siire_tanka)
    from ShohinIns
    group by shohin_bunrui;
select * from burui;

create view bunruiIhuku (shohin_bunrui, sum_hanbai_tanka, sum_siire_tanka)
  as
    select *
    from burui
    where shohin_bunrui = '衣服';

select * from bunruiIhuku

select count(distinct shohin_bunrui) from ShohinIns

drop view bunruiIhuku;

drop view burui;

select * from ShohinIns;

select shohin_bunrui, cnt_shohin_bunrui
  from
    (select shohin_bunrui, count(*) as cnt_shohin_bunrui
    from ShohinIns
    group by shohin_bunrui) as ShohinCnt;

select shohin_bunrui, shohin_id
  from ShohinIns;

select *
from ShohinIns
where hanbai_tanka > (select avg(hanbai_tanka) from ShohinIns);

select *
from ShohinIns
where hanbai_tanka > avg(hanbai_tanka);

select shohin_mei, (select avg(hanbai_tanka) from ShohinIns)
  from ShohinIns;

select shohin_mei, shohin_avg from shohin_mei (select avg(hanbai_tanka) from ShohinIns) as shohin_avg ;

select shohin_bunrui, cnt_shohin_bunrui
  from
    (select shohin_bunrui, count(*) as cnt_shohin_bunrui -- asが必要
    from ShohinIns
    group by shohin_bunrui) as ShohinCnt; -- asが必要

select shohin_bunrui, avg(hanbai_tanka)
  from ShohinIns
  group by shohin_bunrui
  having avg(hanbai_tanka) > (select avg(hanbai_tanka) from ShohinIns);

select shohin_mei, hanbai_tanka
  from ShohinIns as s1
  where hanbai_tanka >
    (
      select avg(hanbai_tanka)
      from ShohinIns as s2
      where s1.shohin_bunrui = s2.shohin_bunrui
      group by shohin_bunrui
    );

create view Practice (shohin_mei, hanbai_tanka, torokubi)
  as select shohin_mei, hanbai_tanka, torokubi
    from ShohinIns
    where hanbai_tanka >= 1000 and torokubi = '2009-09-20';

select * from ShohinIns;

select shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, (select avg(hanbai_tanka) from ShohinIns) as hanbai_tanka_all
  from ShohinIns;

create view AVGTrankaByBunrui (shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, avg_hanbai_tanka)
  as select
    shohin_id,
    shohin_mei,
    shohin_bunrui,
    hanbai_tanka,
    (
      select avg(hanbai_tanka)
      from ShohinIns as s2
      where s1.shohin_bunrui = s2.shohin_bunrui
      group by shohin_bunrui
    )
  from ShohinIns as s1;

select * from AVGTrankaByBunrui;
