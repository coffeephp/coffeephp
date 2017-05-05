<div class="users-show  row">

    <div class="col-md-3">
        {{ partial("users/partials/basicinfo") }}
    </div>

    <div class="panel main-col col-md-9 left-col">

        <div class="panel-body ">

            <div class="">
                <h2><i class="fa fa-paper-plane" aria-hidden="true"></i>新建专栏</h2>
            </div>

            <hr>

                <form class="form-horizontal" method="POST" action="{{ url("blogs/store") }}" accept-charset="UTF-8" id="topic-create-form" enctype="multipart/form-data">
                    <input type="hidden" name="{{ security.getTokenKey() }}" value="{{ security.getToken() }}"/>
                    <div class="form-group">
                        <label for="" class="col-sm-2 control-label">专栏名称</label>
                        <div class="col-sm-6">
                            <input class="form-control" name="name" type="text" value="" maxlength="20" required>
                        </div>
                        <div class="col-sm-4 help-block">
                            20 个字符以内。
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-2 control-label">别名</label>
                        <div class="col-sm-6">
                            <input class="form-control" name="slug" type="text" value="" maxlength="25" required>
                        </div>
                        <div class="col-sm-4 help-block">
                            如：http://url.com/{别名}
                            <br>
                            仅包含字母、数字、破折号（ - ）以及下划线（ _ ）。
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-2 control-label">专栏介绍</label>
                        <div class="col-sm-6">
                            <textarea class="form-control" rows="3" name="description" cols="50" maxlength="250"></textarea>
                        </div>
                        <div class="col-sm-4 help-block">
                            请简要描述。
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-2 control-label">封面设置</label>
                        <div class="col-sm-6">
                            <input type="file" name="cover" required value="">
                        </div>
                        <div class="col-sm-4 help-block">
                            专栏封面，请上传正方形封面。
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-6">
                            <input class="btn btn-primary" id="user-edit-submit" type="submit" value="提交">
                        </div>
                    </div>
                </form>
        </div>

    </div>
</div>