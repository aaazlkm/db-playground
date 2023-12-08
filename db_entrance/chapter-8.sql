use shop;

show tables;

select
  shohin_id,
  shohin_mei,
  shohin_bunrui,
  hanbai_tanka,
  rank () over ( order by hanbai_tanka) as rank1,
  dense_rank () over ( order by hanbai_tanka) as dense_rank1,
  row_number () over ( order by hanbai_tanka) as row_number1
from Shohin;

select
  shohin_id,
  shohin_mei,
  shohin_bunrui,
  hanbai_tanka,
  dense rank () over ( order by hanbai_tanka) as rank_
from Shohin;


SELECT
  shohin_id,
  shohin_mei,
  hanbai_tanka,
  AVG(hanbai_tanka) over (order by shohin_id) as a
from Shohin;

SELECT
  shohin_id,
  shohin_mei,
  hanbai_tanka,
  AVG(hanbai_tanka) over (order by shohin_id rows between current row and 2 FOLLOWING)
from Shohin;

SELECT
  shohin_bunrui,
  sum(hanbai_tanka)
from Shohin
group by shohin_bunrui with rollup;

SELECT
  shohin_bunrui,
  torokubi,
  case when grouping(torokubi) = 1 then '合計' else cast(torokubi as char) end,
  sum(hanbai_tanka)
from Shohin
group by shohin_bunrui, torokubi with cube;

insert into Shohin (shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, siire_tanka, torokubi) values
('0008', 'セーター', '衣服', 3000, 1500, null);

select * from Shohin;

select
  torokubi,
  hanbai_tanka,
  sum(hanbai_tanka) over (order by torokubi)
from Shohin
order by torokubi;

select * from category;
