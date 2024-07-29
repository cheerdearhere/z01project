# I. 화면
## A. document.querySelector()
- 때에 따라 querySelector()가 동작하지 않거나 사이드 이펙트가 발생하기도함
- 프로젝트에서 주로 사용하는 기능으로 사용 : JQuery, javascript 기타 등등
- document를 사용하는 경우 querySelector보다 getElementBy... 사용
  - 때에 따라 다름 
## B. $.each(function(idx,el){...})
- `$(쿼리)`를 사용하지 않는 경우 작동하지 않는 경우가 있으므로 주의
## C. date-value attribute
- 이전에는 많이 사용했으나 지금은 굳이..
- 쓰고자 한다면 어떤 것도 태그 내에 지정할 수 있다
- 그냥 권장
```javascript
   $(쿼리).val("${EL문}");
```
## D. 인코딩 타입 주의하기
- 프로젝트에 따라 인코딩 타입이 다름
  - EUC-KR, UTF-8, ISO-....
- 타입에따라 잘 지킬 것
- 크롬의 경우 기본 세팅이 UTF-8
## E. 가능하면 한 곳에서 처리
- 각 컴포넌트에서 기능을 분할해 처리하던 React.js와 다름
- 부분 렌더가 아닌 전체 렌더임을 기억하고 함수를 나누기보다 가능한 한 곳에서 처리. 
- 유지보수 입장에서 주의
## F. Explorer 체크
- 익스플로러를 사용하는 경우 크롬에서는 안되는 처리가 있으므로 주의
- input 타입이나 여러 함수가 동작하지 않거나 인식하지 않을 수 있음
- 아래 태그는 익스플로러에서 처리안됨
```html
<input type="number"/>
<input type="date"/>
```

# II. 입출력
## A. 한 쪽에서만 처리
- 화면에서만 처리할지 서버에서 처리할지 한 곳에서만 처리하도록
- 인코딩 문제로 계속 한글이 깨짐
- ajax를 사용
```javascript
const formData = $("#form_element");

//form tag인지 확인
const param;
if(formData.tagName.toLowerCase() === 'form'){
    param = formData.serialize();
}else{
    param = formData;
}

// JSON을 사용한 문자 스트림화 
param = JSON.parse(decodeURIComponent(JSON.stringify(param)));

// ajax로 전달
$.ajax({
    url: url, 
    type: method,
    data: param, 
    dataType: "json",
    contentType: "application/x-www-form-urlencoded; charset=euc-kr",
    success: function(data){
        if(data.RESULT_CODE === "0000"){
            fn_updateCslStat(data.csl_no, "06");
            return true;
        } else if(data.RESULT_CODE === "0001"){
            alert("저장에 실패했습니다.");
            return false;
        }else{
            alert("서버에러: "+data.RESULT_MSG);
            return false;
        }
    },
    error: function (err){
        console.log(err);
        alert("서버 에러: "+err.msg);
    }
});
```
- ajax를 쓰지않고 submit()하는 경우
  - 예시
  ```javascript
  form_element.submit();
  ```
  - 서버에서 처리 
```java
String hng_str = StringUtil.nvl(new String(data.getString("form_element").getBytes("8859_1"), "euc-kr"), "");
```
## B. name 잘 사용하기
- 여러 태그의 같은 name을 통해 Obj로 파라미터를 받으면 컴마(,)로 join된 문자열로 전달됨
```html
<input name="data1" value="1"/>
<input name="data1" value="2"/>
<input name="data1" value="3"/>
<input name="data1" value="4"/>
```
- 받는 경우
```java
import org.springframework.web.bind.annotation.PathVariable;

@PathVariable DataObj dataObj;
//dataObj.data1 = 1,2,3,4
```
## C. front - server - db의 속성명은 같게
- 이름이 달라지는 hidden type은 자제
  - 명칭이 달라지고
  - 처리가 복잡하고
  - 유지보수가 귀찮음
- front.input.name == server.obj.fildName == db.table.columnName

# III. 서버
## A. VO 만드는걸 두려워 말기
- Is_reg 같은 구분안된 코드는 사용하지 말자. 
  - 화면에서만 사용되는 경우라면 주석으로 표기, 설명
  - VO 변수명 사용시 최대한 DB 컬럼명에 맞춰 사용
  - `Map<String,Object>`보다 `VO`를 만들어 사용하는 것이 좋음
  - 다른 패키지에 있다면 그냥 새로 만들기: SearchVO
  - 메타데이터 검색 잘 활용하기(작명규칙 확인)
## B. SQL 수정하지 않고 최근 순 리스트 처리하기
- 직접 계산해보고 코드화 하기
```markdown
- 총: 21 row
- 나눠 보기
  - 21 ~ 12
  - 11 ~ 10
  - 1
- 계산식으로 만들어보기
  - total_count: 21
  - page_size: 10 
  - 21 ~ 12:
    - 21: 21 - (10 *(1 - 1)) 
    - 12: 21 - (1 * 10) + 1
  - 11 ~ 10
  - 1
```
- 식을 코드로 만들기
```java
//총 페이지
int pageTotCnt = this.cprtMemberService.authrtMngListCnt(cprtAuthVO);
//페이징 역순 처리
int startRow = pageTotCnt - (pagingVO.getPageIndex() * pagingVO.getRecordCountPerPage()) +1;
int endRow = pageTotCnt - (pagingVO.getRecordCountPerPage() * (pagingVO.getPageIndex() - 1));
```
# IV. Database