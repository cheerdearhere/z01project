# I. 일반적
## A. 사용하는 컬럼 직접 입력하기
- *은 마지막에는 실제 사용하는 컬럼 표시
```db2
/*연습에서만*/
SELECT * FROM TABLE1;

/*권장*/
SELECT 
    COLUMN1
    , COLUMN2
    , COLUMN3
FROM 
    TABLE1;
```
## B. Mybatis/ibatis 등 preparedStatement mapping xml시 주석 사용 주의
- preparedStatement에서 매핑으로 사용하는 값들에 대해 주의.
- 주석처리되어 있더라도 주의
  - `?`: 매핑 위치 표기용으로 사용됨
  - `${field}`: ibatis 직접 필드 입력시 사용
  - `#{field}`: mybatis 필드 입력시 사용
## C. 정렬 기준인 컬럼의 데이터 꼭 확인
- varchar 정렬: 1, 11, 111, 2, 21, 3, 4, ...
- int(numeric/decimal) 정렬: 1, 2, 3, 4, 11, 21, 111
```db2
SELECT 
    CD_VALD_VAL 
    , CD_CLS_VAL1
    , CD_CLS_VAL2
    --...
FROM 
    TABLE1
ORDER BY CAST(CD_VALD_VAL AS INT)
```
## D. LISTAGG
- 어떤 컬럼의 값을 합쳐서 하나의 문자열 연결로 반환
```db2
SELECT LISTAGG(CD_CLS_VAL4, ',') WITHIN GROUP (ORDER BY CAST(CD_VALD_VAL AS INT))
FROM TABLE1
WHERE 
    MNGE_CD = 'TARGET_TYP_CD'
    AND USE_YN = 'Y'
```
- 같은 테이블에서 조회할 경우 한번에 같은 조건으로 조회하는 것이 일정한 값을 표출
  - 값이 없어도 표시
```db2
SELECT
    CD_CLS_NM /*값의 기준*/
    , LISTAGG(CD_CLS_VAL3, ',') WITHIN GROUP (ORDER BY CAST(CD_VALD_VAL AS INT)) AS DATA3
    , LISTAGG(CD_CLS_VAL4, ',') WITHIN GROUP (ORDER BY CAST(CD_VALD_VAL AS INT)) AS DATA4
    , LISTAGG(CD_CLS_VAL5, ',') WITHIN GROUP (ORDER BY CAST(CD_VALD_VAL AS INT)) AS DATA5
FROM TABLE1
WHERE 
    MNGE_CD = 'TARGET_TYP_CD'
    AND USE_YN = 'Y'
GROUP BY CD_CLS_NM
```
## E. AUTO INCREASE 안되는 경우 > 직접 채번
```db2
SELECT
    NVL(MAX(CAST(CD_VALD_VAL AS INT)), 0) +1
FROM TABLE1
    MNGE_CD = 'TARGET_TYP_CD'
```
- UPDATE 문의 입력값으로 사용
## F. ROWNUMBER 순번 기준 정하기
```db2
SELECT
    ROWNUMBER() OVER(ORDER BY FIRST_REG_TSTMP DESC) RN
    , NVL(A.COLUMN1, '') AS COLUMN1
    --...
```
## G. 조건에 따라 값 처리해서 컬럼으로 반환하기
```db2
    , CASE 
        WHEN A.CLUS_NO IN (1, 22, 31) THEN VALUE(C.EMAIL_AGRE_YN,'1')
        ELSE ''
    END AS EMAIL_ARGE_YN
```
## G. WITH UR: UNCOMMITED READ
- 트랜잭션 처리된 경우 커밋을 기다리지 않은(ROLLBACK 여지가 있는) 데이터를 포함해 사용
- COMMIT되지 않아 롤백 여지가 있고 dirty data가 읽혀질 수 있어 insert/update/delete 처링에서 정확한 정보입력이 중요한 경우 절대금지
- 조회성 프로그램인 경우에는 사용하면 좋음
  - `WITH UR FOR READ ONLY`
- 오라클의 경우 UNCOMMITED DATA를 RBS라는 곳에 따로 보관하므로 데이터 변경과 무관하게 작업 가능
## F. FETCH: 조회 결과중 일부만 지정해서 처리
  - [OFFSET ROWS] `FETCH` [`FIRST` | `NEXT`] [row_count | percent] `ROWS` [`ONLY` | `WITH TIES`]
  - 첫 줄만 얻는 경우: (SELECT 쿼리) `FETCH FIRST 1 ROW ONLY`
## G. 직접 VIEW 만들어서 JOIN
```SQL
LEFT OUTER JOIN (
    SELECT 
        C.CD_CLS_VAL AS PURCH_CO_CD
    FROM 
        TABLE1
    WHERE 
        CD_VALD_VAL = ${cd_vald_val}
) TABLE1_C
ON TABLE1_C.PURCH_CO_CD = A.PURCH_CO_CD
```
## H. DECODE
- 대상컬럼을 조건에 따라 변경
- 단순 값 차이에 의한 변경일때 유용
- 너무 많은 경우 가독성이 떨어질 수 있음
  - 차라리 `CASE WHEN THEN ELSE END`가 가독성이 좋을 수 있음
```ORACLE
DECODE(CONDITION_COLUMN, '조건1','결과1','조건2','결과2', .., 'DEFAULT_VALUE') AS RETURN_COLUMN
```
## I. IN(...)에도 SELECT 문 가능
## J. WITH ... AS ()로 임시테이블을 만들면 더 가독성을 높일 수 있다.
```db2
WITH TMP1 AS (
    SELECT
        A.COLUMN1 AS A
        , B.COLUMN2 AS B
        , C.COLUMN1 AS C
    FROM
        TABLE1 A
        , TABLE2 B
        , TABLE3 C
    WHERE 
        A.SEQ = B.SEQ
        AND A.SEQ = C.SEQ
), TMP2 AS (
    ...
)
SELECT * FROM TMP1, TMP2
```

# II. 회사별로 다름
## A. 기본 DB2에는 없으나 내부에서 함수나 프로시저를 만들어놓는 경우가 있음
- NVL
- NVL2
- DECODE
- MERGE...
## B. 가상테이블(VIEW) 사용시 dual 대신 사용하는 것 확인
- SYSIBM.SYSDUMMY1
## C. 검색하고 생각하자
- 어떤 쿼리에 대해 이해가 되지 않을때는
  - 그 키워드로 검색해 사용하는 방식 찾아보기
  - 그래도 모르겠다면 검색
  - 그래도 모르겠다면 질문