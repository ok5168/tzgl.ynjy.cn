Gui Add, ActiveX, x0 y0 w1000 h900 vWB, Shell.Explorer  ; 最后一个参数是 ActiveX 组件的名称.



WB.Navigate("http://tzgl.ynjy.cn/")  ; 这是 web 浏览器控件的特性.


;Gui,+alwaysontop +LastFound +Border
;winset,transparent,210
;gui,-caption
Gui Show,W1000 H700


;判断网页加载完成
while, WB.ReadyState != 4
; while, WB.Busy
   Sleep, 10




;Sleep, 3000
;wb.document.getElementById("txtLoginID").value="530702"
;WB.document.getElementById("txtLoginID").value="hhx31415926"
;MsgBox % wb.document.forms[1].query.value

wb.document.getElementById("txtLoginID").focus() ;调置一个焦点
SendInput ,530702
;Sleep, 300

WB.document.getElementById("txtPassWord").focus()
SendInput ,hhx31415926

wb.document.getElementById("btnLogin").click() ;点击登陆按钮


;----------填表操作-----------------------
#1::

;  点击“统计数据”按钮
wb.document.getElementById("rightFrame").contentWindow.document.getElementById("btnJiBiao").click() 
sleep,3000

;取得表中计算机台数
jishuanji:=wb.document.getElementById("rightFrame").contentWindow.document.getElementById("frameHtml").contentWindow.document.getElementById("Text65").value

;多媒体进教室数
tuomeiti:=wb.document.getElementById("rightFrame").contentWindow.document.getElementById("frameHtml").contentWindow.document.getElementById("Text64").value

jishuanjijiage:=4500 ;设定单台电脑价格
tuomeitijiage:=20000 ;一套多媒体价格


wb.document.getElementById("rightFrame").contentWindow.document.getElementById("frameHtml").contentWindow.document.getElementById("Text24").value:=jishuanji*jishuanjijiage
wb.document.getElementById("rightFrame").contentWindow.document.getElementById("frameHtml").contentWindow.document.getElementById("Text25").value:=jishuanji*jishuanjijiage*0.08
wb.document.getElementById("rightFrame").contentWindow.document.getElementById("frameHtml").contentWindow.document.getElementById("Text26").value:=tuomeiti*tuomeitijiage



return
;-------------------------------------


;只有这个能在IE和chrome中都通过！！！！
;  document.getElementById("rightFrame").contentWindow.document.getElementById("frameHtml").contentWindow.document.getElementById("Text57").value=44

;在chrome中测试成功 IE不通过
;  document.getElementById("rightFrame").contentDocument.getElementById("frameHtml").contentDocument.getElementById("Text57").value=44

;另一种方法，在chrome中测试成功 IE不通过
;document.getElementsByTagName("frame")[3].contentDocument.getElementById("frameHtml").contentDocument.getElementById("Text57").value=44