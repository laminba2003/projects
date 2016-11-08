<h1 class="icon-32">Builder/Edit/${id}</h1>
<div id="editor">
 <textarea>
 ${content}
 </textarea>
</div>
<script src="${js}/codemirror-5.20.2/lib/codemirror.js"></script>
<link rel="stylesheet" href="${js}/codemirror-5.20.2/lib/codemirror.css">
<script src="${js}/codemirror-5.20.2/mode/xml/xml.js"></script>
<script>
var myCodeMirror = CodeMirror.fromTextArea($("#editor > textarea")[0]);
</script>