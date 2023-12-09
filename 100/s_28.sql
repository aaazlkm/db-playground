select
  store_cd,
  () as medium
from receipt
group by store_cd
order by medium desc
limit 5;

select
  amount,
  rank
from
  select amount, row_number () over (order by amount) from receipt ;
where rank = 5;

-- amoutを取り出す



-- gourp by でグループしたテーブルの中央値ってどうやって出せばいいのだ？
-- 下記のようにmediumに該当する処理を作成したいけど、そんな方法なくない？
-- gourp byでまとめたテーブルにアクセス方法ってあるのだろうか？
  store_cd,
  medium( /* ここにテーブルから中央値を出す処理を書きたい */ ) as medium
from receipt
group by store_cd
order by medium desc
limit 5;

select
  store_cd,
  amount,
  rank
from
  (
    select
      store_cd,
      amount,
      (row_number () over (order by amount)) as rank
    from receipt as r2
    where r1.store_cd = r2.store_cd
  ) as e
where
  rank =
    (
      select
        count(*)
      from
        receipt as r2
      where
        r1.store_cd = r2.store_cd
    ) / 2

-- これgourp byにとらわれない方がいいな。select selectでforみたいなことをした方がいいのかもしれない
select
  distinct store_cd, amount
from receipt as r1
where
  (
    SELECT
      amount
    from
      (
        select
          store_cd,
          amount,
          rank
        from
          (
            select
              store_cd,
              amount,
              (row_number () over (order by amount)) as rank
            from receipt as r2
            where r1.store_cd = r2.store_cd
          ) as e
        where
          rank =
            (
              select
                count(*)
              from
                receipt as r2
              where
                r1.store_cd = r2.store_cd
            ) / 2
    ) as dcadsa
  ) = r1.amount
order by amount desc
limit 5;

SELECT
  *
FROM receipt;
SELECT
  count(*),
  count(distinct sales_epoch),
    count(distinct sales_epoch)
FROM receipt;

select
  store_cd,
  amount,
from receipt as r2
where
  (
    select
      rank
    from
      (
        select
          store_cd,
          amount,
          (row_number () over (order by amount)) as rank
        from receipt as r2
        where r1.store_cd = r2.store_cd
      ) as e
  ) ==
  (
    select
      count(*)
    from
      receipt
    where
      r1.store_cd = r2.store_cd
  ) / 2;


select
  *
from receipt,
  (SELECT PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY sale) FROM sales)
order by amount;

sql

SELECT
    store_cd,
    PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY amount) AS amount_50per
FROM receipt
GROUP BY store_cd
ORDER BY amount_50per DESC
LIMIT 5;

select store_cd, avg(amount) as avg from receipt group by store_cd order by avg desc limit 5;

select
    store_cd,
    (select percentile_cont(0.5) within group(order by amount)) as amount_50per
from receipt
group by store_cd
order by amount_50per desc
limit 5;
