create table Shohin(
  shohin_id char(4) not null,
  shohin_mei varchar(100) not null,
  shohin_bunrui varchar(32) not null,
  hanbai_tanka INTEGER default 0,
  siire_tanka integer,
  torokubi date,
  primary key (shohin_id)
);

Insert Into Shohin (shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, siire_tanka, torokubi) VALUES
('0001', 'Tシャツ', '衣服', 1500, 750, '2023-01-01'),
('0002', 'ジーンズ', '衣服', 2500, 1250, '2023-01-02'),
('0003', 'エプロン', 'キッチン用品', 1000, 500, '2023-01-03'),
('0004', '包丁セット', 'キッチン用品', 3000, 1500, '2023-01-04'),
('0005', '電子レンジ', '電気用品', 5000, 2500, '2023-01-05'),
('0006', '電気ポット', '電気用品', 4000, 2000, '2023-01-06'),
('0007', 'フライパン', 'キッチン用品', 2000, 1000, '2023-01-07');

create table Shohin2(
  shohin_id char(4) not null,
  shohin_mei varchar(100) not null,
  shohin_bunrui varchar(32) not null,
  hanbai_tanka INTEGER default 0,
  siire_tanka integer,
  torokubi date,
  primary key (shohin_id)
);

Insert Into Shohin2 (shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, siire_tanka, torokubi) VALUES
('0005', '電子レンジ', '電気用品', 5000, 2500, '2023-01-05'),
('0006', '電気ポット', '電気用品', 4000, 2000, '2023-01-06'),
('0007', 'フライパン', 'キッチン用品', 2000, 1000, '2023-01-07'),
('0008', 'セーター', '衣服', 3000, 1500, '2023-01-08'),
('0009', 'トースター', '電気用品', 3500, 1750, '2023-01-09'),
('0010', 'ハンドブレンダー', 'キッチン用品', 2500, 1250, '2023-01-10');

select shohin_id, shohin_mei from Shohin
except
select shohin_id, shohin_mei from Shohin2;

create table TenpoShohin(
  tempo_id char(4) not null,
  tempo_mei varchar(200) not null,
  shohin_id char(4) not null,
  suryo integer not null,
  primary key(tempo_id, shohin_id)
);

INSERT INTO TenpoShohin (tempo_id, tempo_mei, shohin_id, suryo) VALUES
('T001', '東京店', '0001', 30),
('T001', '東京店', '0002', 25),
('T001', '東京店', '0003', 15),
('T001', '東京店', '0004', 20),
('O001', '大阪店', '0004', 25),
('O001', '大阪店', '0005', 15),
('O001', '大阪店', '0006', 17),
('O001', '大阪店', '0007', 22),
('N001', '名古屋店', '0003', 17),
('N001', '名古屋店', '0004', 22),
('N001', '名古屋店', '0005', 12);

select ts.tempo_id, ts.tempo_mei, s.shohin_id, s.shohin_mei
from TenpoShohin as ts inner join Shohin2 as s
on ts.shohin_id = s.shohin_id;

select coalesce(ts.tempo_id, '不明'), coalesce(ts.tempo_mei, '不明'), s.shohin_id, s.shohin_mei
from TenpoShohin as ts right outer join Shohin2 as s
on ts.shohin_id = s.shohin_id;


create table ZaikoShohin(
  souko_id char(4) not null,
  shohin_id char(4) not null,
  zaiko_suryo integer not null,
  primary key (souko_id, shohin_id)
);

INSERT INTO ZaikoShohin (souko_id, shohin_id, zaiko_suryo) VALUES
('S001', '0001', 100),
('S001', '0002', 150),
('S001', '0003', 120),
('S001', '0004', 140),
('S002', '0003', 100),
('S002', '0004', 120),
('S002', '0005', 70),
('S002', '0006', 95),
('S002', '0007', 115);

select ts.tempo_id, ts.tempo_mei, s.shohin_id, s.shohin_mei, zs.souko_id, zs.zaiko_suryo
  from TenpoShohin as ts
     left outer join Shohin as s on ts.shohin_id = s.shohin_id
     left outer join ZaikoShohin as zs on ts.shohin_id = zs.shohin_id
where ts.tempo_id = 'N001';

select ts.tempo_id, ts.tempo_mei, s.shohin_id, s.shohin_mei
from TenpoShohin as ts cross join Shohin as s

select ts.tempo_id, ts.tempo_mei, s.shohin_id, s.shohin_mei, zs.souko_id, zs.zaiko_suryo
  from TenpoShohin as ts
     left outer join Shohin as s on ts.shohin_id = s.shohin_id
     left outer join ZaikoShohin as zs on ts.shohin_id = zs.shohin_id
where ts.tempo_id = 'N001';


select ts.tempo_id, ts.tempo_mei, s.shohin_id, s.shohin_mei
from TenpoShohin ts, Shohin2 s
where ts.shohin_id = s.shohin_id
  and ts.tempo_id = 'N001';

create table Skill(
  skill varchar(100) not null,
  primary key (skill)
);

INSERT INTO Skill (skill) VALUES
('Oracle'),
('Unix'),
('Java');

select * from skill;


create table EmpSkill(
  emp varchar(100) not null,
  skill varchar(100) not null,
  primary key (emp, skill)
);

INSERT INTO EmpSkill (emp, skill) VALUES
('Emp001', 'Oracle'),
('Emp001', 'Java'),
('Emp002', 'Unix'),
('Emp002', 'Java'),
('Emp003', 'Oracle'),
('Emp003', 'Unix'),
('Emp003', 'Java'),
('Emp004', 'Java'),
('Emp005', 'Oracle'),
('Emp006', 'Unix');

select * from empskill;

    (
      select skill from Skill
    )
        except
    (
      select skill
      from EmpSkill
      where emp = 'Emp006'
    )


-- グループ中の各行を取るにはサブくえりで表現するしかない
select DISTINCT emp
from EmpSkill as e1
where not exists
  (
    (
      select skill from Skill
    )
    except
    (
      select skill
      from EmpSkill as e2
      where e1.emp = e2.emp
    )
  );

select emp, count(skill)
from EmpSkill
where emp = 'Emp003'
group by emp;
