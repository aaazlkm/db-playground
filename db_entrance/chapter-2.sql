select * from shohin;
select DISTINCT shohin_bunrui  from shohin;
select DISTINCT shohin_bunrui, shohin_mei from shohin;
select shohin_mei, shohin_bunrui, hanbai_tanka from shohin where shohin_bunrui = 'ihuku';
-- dkalcdka
-- njckdna
-- dklac
select shohin_mei, hanbai_tanka , hanbai_tanka * 2 from shohin;
select shohin_mei, hanbai_tanka , 300 as const, hanbai_tanka * const from shohin;
select shohin_mei, hanbai_tanka from shohin;
select shohin_mei, hanbai_tanka from shohin where hanbai_tanka <> 500;
select * from shohin;
select * from shohin where torokubi > '2009-09-20';
select * from shohin where hanbai_tanka - siire_tanka > 500;
select * from shohin where siire_tanka is NULL;
select shohin_mei, hanbai_tanka from shohin where not hanbai_tanka <> 500;
select * from shohin where shohin_bunrui = 'ihuku' and siire_tanka = 500 or torokubi > '2009-09-20' or torokubi < '2009-09-20';

select shohin_mei, siire_tanka from shohin where siire_tanka is NULL

select shohin_mei, hanbai_tanka, siire_tanka from shohin where hanbai_tanka - siire_tanka >= 500;
select shohin_mei, hanbai_tanka, siire_tanka from shohin where not hanbai_tanka - siire_tanka < 500;
select shohin_mei, hanbai_tanka, siire_tanka from shohin where hanbai_tanka >= 500 + siire_tanka;

select shohin_mei, shohin_bunrui, hanbai_tanka,  siire_tanka, (hanbai_tanka * 0.9 - siire_tanka) as rieki from shohin WHERE (hanbai_tanka * 0.9 - siire_tanka > 0);
