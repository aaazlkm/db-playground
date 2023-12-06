
use shop;

select * from ShohinIns;

select * from ShohinIns where shohin_mei like 'T%';

select * from ShohinIns;

select * from ShohinIns where hanbai_tanka between 1000 and 5000;

select * from ShohinIns where hanbai_tanka = null;

select * from ShohinIns where hanbai_tanka is null;

select * from ShohinIns where hanbai_tanka is not null;

update ShohinIns
  set hanbai_tanka = null
  where shohin_mei = 'セーター';

select * from ShohinIns where hanbai_tanka in (102, 2500, 1500)

select * from ShohinIns where hanbai_tanka in (select hanbai_tanka from ShohinIns where shohin_id = '0001')

select * from ShohinIns as s1 where exists (select hanbai_tanka from ShohinIns as s2 where s2.shohin_id = s1.shohin_id)

select * from ShohinIns

select shohin_mei, shohin_bunrui,
  (case when shohin_bunrui = '衣服' then 'A:' || shohin_bunrui
      when shohin_bunrui = 'キッチン用品' then 'B:' || shohin_bunrui
      when shohin_bunrui = '電気用品' then 'C:' || shohin_bunrui
      else "aaaaa"
  end) as aa
from ShohinIns;

select * from ShohinIns where hanbai_tanka  not in (null)

select
  count(
    case
      when hanbai_tanka <= 1000 then 1
      else null
    end
  ) as low_price,
  count(
    case
      when 1000 < hanbai_tanka and hanbai_tanka <= 3000 then 1
      else null
    end
  ) as mid_price,
  count(
    case
      when 3000 < hanbai_tanka then 1
      else null
    end
  ) as high_price
from ShohinIns;

select * from ShohinIns
