
# jQuery DOM ����
`$("QuerySelector")`
## 1. �⺻ query selector
- `*` : �����
- `element` : ������ ��� �̸��� ���� ��� ���
- `#id`: ������ id Ư������ ���� element
- `.class`: ������ classƯ������ ���� ��� ��ҵ�
- `selector1, selector2` : �ϳ��̻��� �����Ϳ� ��ġ�ϴ� ��� ��ҵ�
## 2. ���� Ž��
- `ancestor(����)descendant` : �ٸ���� ������ҵ� Ž��
    - `$("ul a")`
-  parent > child : �ٸ� ����� �������� �ڽ� ��ҵ� Ž��
- `$("li > a")`
- `previous + next` : ���� ��� ���Ŀ��� ���� ������ �ִ� �̿� ���
    - `$("h1 + span")`
- `previous ~ sibling` :���� ��� ���� ��� �̿� ��ҵ�
    - `$("a ~ h3")`
## 3. element attribute/properties Ž��
- `elemment:[�Ӽ�='�Ӽ���']`: �ش� �Ӽ��� �� üũ
    - ex) `$("input:checkbox[name='seq'"]).prop("checked",true);`

## 4. DOM traversing
- ����: `$("#targetElement").�Լ�();`
- chaining���� ó�� ����
- �Լ�
    - `parent()`: �ٷ� �� ����(�θ�) �±�
        - `document.getElementById('elId').parentElement;`
    - `parents()`: �θ���� ��� ���� �±�
    - `parentUntil('���� �±�')`: �θ�κ��� ������ �±� ���������� ��� ���� �±�
    - `closest('�˻��� ����������')`: ���� �±� �� ���������ͷ� �˻�
    - `children()`: ��� �ڽ� �±�
        - `document.querySelector('#elId').children;`
    - `first()`: ���� �±׸� ������ ��� �� ù �±�
        - ex) `$('div#elId').children().first();`
        - `document.querySelector('#elId').firstChild;`
    - `last()`: ���� �±׸� ������ ��� �� ������ �±�
        - ex) `$('div#elId').children().last();`
        - `ducument.getElementById('elId').lastChild;`
    - `eq(index_numeric)`: ���� �±׸� ������ ���
        - ex) `$('div#elId').children().el(3);`
        - index 3�� �±� = 4��° �±�
        - `document.querySelector('#elId').children()[3];`
    - `find('��� �±�')`: �ļ� �±� �˻�
        - ex) `$('div#elId').find('span')`
        - `document.querySelector('#elId').getElementsByTagName('span');`
    - `next()`: �̿�(����) �±� �� ���� �±�
        - `document.getElementById('elId').nextElementSibling;`
    - `nextAll()`: ���� �±� �� ���� �±� �ڷ� ������ ��� �±׵�
    - `nextUntil('�˻��� ����������')`: ���� �±� �� ���� �±� �ں��� �˻��� ������ �±� ���� ��� �±�
    - `prev()`: ���� �±� �� ���� �±�
        - `document.querySelector('#elId').prevElementSibling
    - `prevAll()`: ���� �±� �� ���� �±� ������ ������ ��� �±׵�
    - `prevUntil('�˻��� ����������')`: ���� �±� �� ���� �±� ������ �˻��� ������ �±� ���� ��� �±�
    - `siblings()`: ��� ���� �±�
    - `filter('�˻��� ����������')`: ���� �±׸� ������ ��� ���� �����Ϳ� �´� ���
        - ex) `$("input:text").filter("#elId");`
## 5. tag ����ϱ�
- get: jquery ��ü�� javascript ��ü�� ��ȯ
    - `$('#elId').get(0); // <div id="elId"></div>`
- attr: ����� attribute ��ȸ, ����
    - `$('#elId').attr("name");//��� �±� name�� ��`
    - `$('#elId').attr("name","�����Ұ�");//��� �±��� name ����`
    - `document.getElementById('elId').name = '�����Ұ�';`
- val: ��� �±��� ��(value �Ӽ�)
    - `$('#elId').val();//��� �±� value�� ��`
    - `$('#elId').val("�����Ұ�");//��� �±��� value ����`
    - `document.getElementById('elId').value = '�����Ұ�';`
- prop: attr�� ����. �Ӽ� �� true/false ���� ������ �Ӽ�(properties) ó��
    - hidden, readonly, checked ��
    - `disabled`�� �ѹ� true �Ǹ� �ν� �ȵ�
    - `$('#elId').prop("checked");//��� �±� ������Ƽ�� ��`
    - `$('#elId').prop("checked", boolean);//��� �±��� ������Ƽ ����`
    - `document.getElementById('elId').checked = boolean;`
- addClass: class �߰�
    - `$('#elId').addClass("selected");//��� �±׿� Ŭ���� �߰�`
    - `document.getElementById('elId').classList.add("selected");`
- removeClass: class ����
    - `$('#elId').removeClass("selected");//��� �±׿� Ŭ���� �߰�`
    - `document.getElementById('elId').classList.remove("selected");`
- toggleClass: class ���
    - `$('#elId').toggleClass("selected");//��� �±׿� Ŭ���� �߰�`
    - `document.getElementById('elId').classList.toggle("selected");`
- html: innerHTML
    - `$('#elId').html();//��� �±� content`
    - `$('#elId').html("input content");//��� �±� content ����`
    - `document.getElementById('elId').innerHTML="input content";`
- text: text content �Է�. �±״� �׳� ���ڿ��� ���޵�
    - `$('#elId').text();//��� �±� content`
    - `$('#elId').text("input content only text <br/>?");//��� �±� content ���ڿ��� �Է�`
- css: ��Ÿ�� �Ӽ� ��ȸ/����
    - `$('#elId').css('width'); // 465px`
    - `$('#elId').css('width', 300); // 300px�� ����`
    - `$('#elId').css({ width: 300, height: 300 }); // ���� ��Ÿ�� ���� ����`
    - `document.getElementById('elId').style.width = '300px';`
- height: �±��� ����
    - `$('#elId').height();`
    - `document.getElementById('elId').style.height;`
- width: �±��� �ʺ�
    - `$('#elId').width();`
    - `document.getElementById('elId').style.width;`
- position: �±��� ������� ��ġ
    - `$('#elId').position(); // { left: ��, top: �� }`
    - `var el = document.getElementById('elId');//{ left: el.offsetLeft, top: el.offsetTop }`
- data: �±׿� �����͸� ��ȸ�ϰų� ����.
    - html5������ �±׿� �����͸� ���� ����.
    - data-age, data-name, data-value...
        - `$('#elId').data('useyn'); // �� ��ȸ`
        - `$('#elId').data('useyn', 0); // data-useyn�� 0���� ����`
        - `document.getElementById('elId')['data-useyn'] = 1;`

## 6. utils
- $.each(`array/object`,`(key,value)=>...`): ES5�� forEach�̳� for ~ in���� ����
    - `array/object`.forEach(`(key,value)=>...`);
- $.extend(`targetObj`,`resourceObj`);: targetObj�� resourceObj�� �Ӽ� ����. Object.assign�� ����
    - Object.assign(`targetObj`,`resourceObj`);
- $.trim(`       st  rin  g   `): ���ڿ��� ���� ����
    - `       st  rin  g   `.trim(); // ==> `string`
- $.inArray: `array.indexOf()`
- $.proxy(`targetObj`,`bindedObj`): Ÿ���� this�� bind ������� ����. ES5������ bind�� ����
    -  `targetObj.bind(bindedObj);
- $.type(`obj`): typeof ����.
    - typeof�� null, Date �� javascript�� �پ��� Ŭ�������� Object�� ó��
    - new �����ڸ� ���� ���� ���ͷ��� Object�� ó��
    - ���Խĵ� object
```javascript
$.type(new Date); // date
$.type(null); // null
$.type(new Number(12)); // number
$.type([1, 2, 3]); // array
$.type(/s/); // regexp
```