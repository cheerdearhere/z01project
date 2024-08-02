# I. �Ϲ���
## A. ����ϴ� �÷� ���� �Է��ϱ�
- *�� ���������� ���� ����ϴ� �÷� ǥ��
```db2
/*����������*/
SELECT * FROM TABLE1;

/*����*/
SELECT 
    COLUMN1
    , COLUMN2
    , COLUMN3
FROM 
    TABLE1;
```
## B. Mybatis/ibatis �� preparedStatement mapping xml�� �ּ� ��� ����
- preparedStatement���� �������� ����ϴ� ���鿡 ���� ����.
- �ּ�ó���Ǿ� �ִ��� ����
  - `?`: ���� ��ġ ǥ������� ����
  - `${field}`: ibatis ���� �ʵ� �Է½� ���
  - `#{field}`: mybatis �ʵ� �Է½� ���
## C. ���� ������ �÷��� ������ �� Ȯ��
- varchar ����: 1, 11, 111, 2, 21, 3, 4, ...
- int(numeric/decimal) ����: 1, 2, 3, 4, 11, 21, 111
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
- � �÷��� ���� ���ļ� �ϳ��� ���ڿ� ����� ��ȯ
```db2
SELECT LISTAGG(CD_CLS_VAL4, ',') WITHIN GROUP (ORDER BY CAST(CD_VALD_VAL AS INT))
FROM TABLE1
WHERE 
    MNGE_CD = 'TARGET_TYP_CD'
    AND USE_YN = 'Y'
```
- ���� ���̺��� ��ȸ�� ��� �ѹ��� ���� �������� ��ȸ�ϴ� ���� ������ ���� ǥ��
  - ���� ��� ǥ��
```db2
SELECT
    CD_CLS_NM /*���� ����*/
    , LISTAGG(CD_CLS_VAL3, ',') WITHIN GROUP (ORDER BY CAST(CD_VALD_VAL AS INT)) AS DATA3
    , LISTAGG(CD_CLS_VAL4, ',') WITHIN GROUP (ORDER BY CAST(CD_VALD_VAL AS INT)) AS DATA4
    , LISTAGG(CD_CLS_VAL5, ',') WITHIN GROUP (ORDER BY CAST(CD_VALD_VAL AS INT)) AS DATA5
FROM TABLE1
WHERE 
    MNGE_CD = 'TARGET_TYP_CD'
    AND USE_YN = 'Y'
GROUP BY CD_CLS_NM
```
## E. AUTO INCREASE �ȵǴ� ��� > ���� ä��
```db2
SELECT
    NVL(MAX(CAST(CD_VALD_VAL AS INT)), 0) +1
FROM TABLE1
    MNGE_CD = 'TARGET_TYP_CD'
```
- UPDATE ���� �Է°����� ���
## F. ROWNUMBER ���� ���� ���ϱ�
```db2
SELECT
    ROWNUMBER() OVER(ORDER BY FIRST_REG_TSTMP DESC) RN
    , NVL(A.COLUMN1, '') AS COLUMN1
    --...
```
## G. ���ǿ� ���� �� ó���ؼ� �÷����� ��ȯ�ϱ�
```db2
    , CASE 
        WHEN A.CLUS_NO IN (1, 22, 31) THEN VALUE(C.EMAIL_AGRE_YN,'1')
        ELSE ''
    END AS EMAIL_ARGE_YN
```
## G. WITH UR: UNCOMMITED READ
- Ʈ����� ó���� ��� Ŀ���� ��ٸ��� ����(ROLLBACK ������ �ִ�) �����͸� ������ ���
- COMMIT���� �ʾ� �ѹ� ������ �ְ� dirty data�� ������ �� �־� insert/update/delete ó������ ��Ȯ�� �����Է��� �߿��� ��� �������
- ��ȸ�� ���α׷��� ��쿡�� ����ϸ� ����
  - `WITH UR FOR READ ONLY`
- ����Ŭ�� ��� UNCOMMITED DATA�� RBS��� ���� ���� �����ϹǷ� ������ ����� �����ϰ� �۾� ����
## F. FETCH: ��ȸ ����� �Ϻθ� �����ؼ� ó��
  - [OFFSET ROWS] `FETCH` [`FIRST` | `NEXT`] [row_count | percent] `ROWS` [`ONLY` | `WITH TIES`]
  - ù �ٸ� ��� ���: (SELECT ����) `FETCH FIRST 1 ROW ONLY`
## G. ���� VIEW ���� JOIN
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
- ����÷��� ���ǿ� ���� ����
- �ܼ� �� ���̿� ���� �����϶� ����
- �ʹ� ���� ��� �������� ������ �� ����
  - ���� `CASE WHEN THEN ELSE END`�� �������� ���� �� ����
```ORACLE
DECODE(CONDITION_COLUMN, '����1','���1','����2','���2', .., 'DEFAULT_VALUE') AS RETURN_COLUMN
```
## I. IN(...)���� SELECT �� ����
## J. WITH ... AS ()�� �ӽ����̺��� ����� �� �������� ���� �� �ִ�.
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

# II. ȸ�纰�� �ٸ�
## A. �⺻ DB2���� ������ ���ο��� �Լ��� ���ν����� �������� ��찡 ����
- NVL
- NVL2
- DECODE
- MERGE...
## B. �������̺�(VIEW) ���� dual ��� ����ϴ� �� Ȯ��
- SYSIBM.SYSDUMMY1
## C. �˻��ϰ� ��������
- � ������ ���� ���ذ� ���� ��������
  - �� Ű����� �˻��� ����ϴ� ��� ã�ƺ���
  - �׷��� �𸣰ڴٸ� �˻�
  - �׷��� �𸣰ڴٸ� ����