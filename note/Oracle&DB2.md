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