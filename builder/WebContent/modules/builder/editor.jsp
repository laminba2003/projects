<h1 class="icon-32">Builder/${type}/Edit/${id}</h1>
<div>
<div id="files">
<div class="css-treeview">
    <ul>
        <li><input type="checkbox" id="item-0" checked="checked"/><label for="item-0">${id}</label>
            <ul>
                <li><input type="checkbox" id="item-0-0" /><label for="item-0-0">css</label>
                    <ul>
                        <li><a>Item 1</a></li>
                        <li><a>Item 2</a></li>
                        <li><a>Item 3</a></li>
                    </ul>
                </li>
                <li><input type="checkbox" id="item-0-1" /><label for="item-0-1">js</label>
                    <ul>
                        <li><a>Item 1</a></li>
                        <li><a>Item 2</a></li>
                        <li><a>Item 3</a></li>
                    </ul>
                </li>
                <li><input type="checkbox" id="item-0-2"/><label for="item-0-2">images</label>
                   <ul>
                        <li><a>Item 1</a></li>
                        <li><a>Item 2</a></li>
                        <li><a>Item 3</a></li>
                    </ul>
                </li>
                <li><a>Item 1</a></li>
                        <li><a>Item 2</a></li>
                        <li><a>Item 3</a></li>
           </ul>
     </li>
    </ul>
</div>
</div>
<div id="edition">
<div id="tabs">
 <a>index.jsp</a>
</div>
<div id="editor">
 <textarea>${content}</textarea>
</div>
</div>
</div>
<script src="${js}/ace/src/ace.js" type="text/javascript" charset="utf-8"></script>
<script src="${js}/ace/src/ext-language_tools.js"></script>
<script>
   ace.require("ace/ext/language_tools");
    var editor = ace.edit("editor");
    editor.setTheme("ace/theme/eclipse");
    editor.getSession().setMode("ace/mode/jsp");
    editor.setOptions({
        enableBasicAutocompletion: true,
        enableSnippets: true,
        enableLiveAutocompletion: false
    });
</script>
