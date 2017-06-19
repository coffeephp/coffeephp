<div class="blog-pages">
    <div class="col-md-12 panel">
        <div class="panel-body">
            <h2 class="text-center">编辑文章</h2>
            <hr>
            <form method="POST" action="{{ url('articles/' ~ article.id) }}" accept-charset="UTF-8" id="article-create-form">
                <input type="hidden" name="{{ security.getTokenKey() }}" value="{{ security.getToken() }}"/>
                <div class="form-group">
                    <input class="form-control" id="article-title" placeholder="请填写标题" name="title" type="text" value="{{ article.title }}" required="require">
                </div>

                {{ partial("topics/partials/composing_help_block") }}

                <div class="form-group">
                    <textarea required="require" class="form-control" rows="20" style="overflow:hidden" id="reply_content" placeholder="请使用 Markdown 格式书写 ;-)，代码片段黏贴时请注意使用高亮语法。" name="body_original" cols="50">{{ article.body_original }}</textarea>
                </div>

                <div class="form-group status-post-submit">
                    <button class="btn btn-primary submit-btn" type="submit" name="subject" value="publish">发布</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    Config.article_id = '{{ article.id }}';
</script>


<link rel="stylesheet" href="{{ static_url("css/editor.css") }}">
<script src="{{ static_url("js/editor.js") }}"></script>

<script type="text/javascript">
    $(document).ready(function()
    {
        $('#publish-hint').click(function(event) {
            event.preventDefault();
            swal({
                title: "",
                text: "确定要将发布草稿？",
                type: "warning",
                showCancelButton: true,
                cancelButtonText: "取消",
                confirmButtonText: "发布"
            }).then(function () {
                $('<input />').attr('type', 'hidden')
                    .attr('name', "subject")
                    .attr('value', "publish")
                    .appendTo('#article-edit-form');
                $("#article-edit-form").submit();
            }).catch(swal.noop);
        });

        $('#category-select').on('change', function() {
            var current_cid = $(this).val();
            $('.category-hint').hide();
            $('.category-'+current_cid).fadeIn();
        });

        var simplemde = new SimpleMDE({
            spellChecker: false,
            autosave: {
                enabled: 'true',
                delay: 5000,
                unique_id: "article_content"
            },
            forceSync: true,
            toolbar: [
                "bold", "italic", "heading", "|", "quote", "code", "table",
                "horizontal-rule", "unordered-list", "ordered-list", "|",
                "link", "image", "|",  "side-by-side", 'fullscreen', "|",
                {
                    name: "guide",
                    action: function customFunction(editor){
                        var win = window.open('https://github.com/riku/Markdown-Syntax-CN/blob/master/syntax.md', '_blank');
                        if (win) {
                            //Browser has allowed it to be opened
                            win.focus();
                        } else {
                            //Browser has blocked it
                            alert('Please allow popups for this website');
                        }
                    },
                    className: "fa fa-info-circle",
                    title: "Markdown 语法！",
                },
                {
                    name: "publish",
                    action: function customFunction(editor){
                        $('.submit-btn').click();
                    },
                    className: "fa fa-paper-plane",
                    title: "发布文章",
                }
            ],
        });

        inlineAttachment.editors.codemirror4.attach(simplemde.codemirror, {
            uploadUrl: Config.routes.upload_image,
            extraParams: {
                '_token': Config.token,
            },
            onFileUploadResponse: function(xhr) {
                var result = JSON.parse(xhr.responseText),
                    filename = result[this.settings.jsonFieldName];

                if (result && filename) {
                    var newValue;
                    if (typeof this.settings.urlText === 'function') {
                        newValue = this.settings.urlText.call(this, filename, result);
                    } else {
                        newValue = this.settings.urlText.replace(this.filenameTag, filename);
                    }
                    var text = this.editor.getValue().replace(this.lastValue, newValue);
                    this.editor.setValue(text);
                    this.settings.onFileUploaded.call(this, filename);
                }
                return false;
            }
        });
    });
</script>

