<div class="blog-pages">
    <div class="col-md-12 panel">
        <div class="panel-body">
            <h2 class="text-center">推荐分享</h2>
            <hr>
            <form method="POST" action="{{ url('shares') }}" accept-charset="UTF-8">
                <input type="hidden" name="{{ security.getTokenKey() }}" value="{{ security.getToken() }}"/>
                <div class="form-group">
                    <input class="form-control" placeholder="标题" name="title" type="text" required="require">
                </div>

                <div class="form-group">
                    <input class="form-control" placeholder="分享网址 http://coffeephp.com/resources" name="url" type="text"  required="require">
                </div>

                <div class="form-group status-post-submit">
                    <button class="btn btn-primary submit-btn" type="submit" name="subject" value="publish">提交</button>
                </div>
            </form>
        </div>

    </div>
</div>