<div class="col-md-3 side-bar">

    <div class="panel panel-default corner-radius">

        <div class="panel-heading text-center">
            <h3 class="panel-title">作者：{{ topic.users.name }}</h3>
        </div>

        {{ partial("topics/partials/topic_author_box") }}
    </div>

    {% if count(userTopics) %}
    <div class="panel panel-default corner-radius">
        <div class="panel-heading text-center">
            <h3 class="panel-title">{{ topic.users.name }} 的其他话题</h3>
        </div>
        <div class="panel-body">
            <ul class="list">
                 {% for userTopic in userTopics %}
                    <li>
                        <a href="{{ url('topics/') ~ userTopic.id }}" class="popover-with-html" data-content="{{ userTopic.title }}">
                            {{ userTopic.title }}
                        </a>
                    </li>
                {% endfor %}
            </ul>
        </div>
    </div>
    {% endif %}

    {% if count(categoryTopics) %}
    <div class="panel panel-default corner-radius">
        <div class="panel-heading text-center">
            <h3 class="panel-title">分类下其他主题</h3>
        </div>
        <div class="panel-body">
            <ul class="list">
                {% for categoryTopic in categoryTopics %}
                <li>
                    <a href="{{ url('topics/') ~ categoryTopic.id }}" class="popover-with-html" data-content="{{ categoryTopic.title }}" >
                        {{ categoryTopic.title }}
                    </a>
                </li>
                {% endfor %}
            </ul>
        </div>
    </div>
    {% endif %}

    {#<div class="panel panel-default corner-radius" style="#}
    {#text-align: center;#}
    {#background-color: transparent;#}
    {#border: none;#}
    {#">#}
    {#<a href="https://laravel-china.org/topics/3383" rel="nofollow" title="" style="">#}
    {#<img src="https://dn-phphub.qbox.me/uploads/images/201612/09/1/qASrRyKNj0.jpg" style="width: 100%;border-radius: 0px;box-shadow: none;border: 1px solid #ffafaf;"></a>#}
    {#</div>#}

    {#<div class="panel panel-default corner-radius" style="#}
    {#text-align: center;#}
    {#background-color: transparent;#}
    {#border: none;#}
    {#">#}
    {#<a href="https://laravel-china.org/topics/3213" rel="nofollow" title="" style="">#}
    {#<img src="https://dn-phphub.qbox.me/uploads/images/201612/09/1/06fkozmGAH.jpg" style="width: 100%;border-radius: 0px;box-shadow: none;border: 1px solid #e2e1e1;"></a>#}
    {#</div>#}



    {#<div class="panel panel-default corner-radius sidebar-resources">#}
        {#<div class="panel-heading text-center">#}
            {#<h3 class="panel-title">推荐资源</h3>#}
        {#</div>#}
        {#<div class="panel-body">#}
            {#<ul class="list list-group ">#}
                {#<li class="list-group-item ">#}
                    {#<a href="https://laravel-china.org/docs/home" class="popover-with-html no-pjax" data-content="Laravel 中文文档" data-original-title="" title="">#}
                        {#<img class="media-object inline-block " src="https://dn-phphub.qbox.me/uploads/banners/ql9XtosRhTe4v8HVC3TV.jpg">#}
                        {#Laravel 中文文档#}
                    {#</a>#}
                {#</li>#}
                {#<li class="list-group-item ">#}
                    {#<a href="https://lumen.laravel-china.org" class="popover-with-html no-pjax" data-content="Lumen 中文文档" data-original-title="" title="">#}
                        {#<img class="media-object inline-block " src="https://dn-phphub.qbox.me/uploads/banners/bcMFkfsJZpetLgKFwWqY.jpg">#}
                        {#Lumen 中文文档#}
                    {#</a>#}
                {#</li>#}
                {#<li class="list-group-item ">#}
                    {#<a href="https://cs.laravel-china.org/" class="popover-with-html no-pjax" data-content="Laravel 速查表" data-original-title="" title="">#}
                        {#<img class="media-object inline-block " src="https://dn-phphub.qbox.me/uploads/banners/cV55gsrH70qz6VdKr502.jpg">#}
                        {#Laravel 速查表#}
                    {#</a>#}
                {#</li>#}
                {#<li class="list-group-item ">#}
                    {#<a href="http://laravel.so/" class="popover-with-html no-pjax" data-content="Laravel.so 实战技巧" data-original-title="" title="">#}
                        {#<img class="media-object inline-block " src="https://dn-phphub.qbox.me/uploads/banners/ROHXvR4OQwsX4spfOK33.png">#}
                        {#Laravel.so 实战技巧#}
                    {#</a>#}
                {#</li>#}
                {#<li class="list-group-item ">#}
                    {#<a href="http://estgroupe.com/tickets/create" class="popover-with-html no-pjax" data-content="寻求技术合作？ " data-original-title="" title="">#}
                        {#<img class="media-object inline-block " src="https://dn-phphub.qbox.me/uploads/banners/v89tIQ6vjceA6g7JmrQB.png">#}
                        {#寻求技术合作？#}
                    {#</a>#}
                {#</li>#}
            {#</ul>#}
        {#</div>#}
    {#</div>#}



    {#<div class="panel panel-default corner-radius">#}
    {#<div class="panel-body text-center sidebar-sponsor-box">#}
    {#<a class="sidebar-sponsor-link" href="http://www.ucloud.cn/site/seo.html?utm_source=zanzhu&amp;utm_campaign=phphub&amp;utm_medium=display&amp;utm_content=shengji&amp;ytag=phphubshenji" target="_blank">#}
    {#<img src="https://dn-phphub.qbox.me/uploads/banners/IHfTLiWaKJ4CmUL4Tfbc.jpg" class="popover-with-html" data-content="UCloud" width="100%" data-original-title="" title=""></a>#}
    {#</div>#}
    {#</div>#}


    {% if count(randomExcellentTopics) %}
    <div class="panel panel-default corner-radius panel-hot-topics">
        <div class="panel-heading text-center">
            <h3 class="panel-title">随机推荐话题</h3>
        </div>
        <div class="panel-body">
            <ul class="list">
                {% for randomExcellentTopic in randomExcellentTopics %}
                    <li>
                        <a href="{{ url('topics/') ~ randomExcellentTopic.id }}" class="popover-with-html" data-content="{{ randomExcellentTopic.title }}" >
                            {{ randomExcellentTopic.title }}
                        </a>
                    </li>
                {% endfor %}
            </ul>
        </div>
    </div>
    {% endif %}



    {#<div class="box text-center">#}
    {#<p style="margin-bottom: 10px;margin-top: 10px;">订阅 Laravel 资讯</p>#}
    {#<img class="image-border popover-with-html" data-content="扫码，或者搜索微信订阅号：「Laravel资讯」" src="https://dn-phphub.qbox.me/uploads/images/201612/15/1/MGig6IACCQ.png" style="width:80%" data-original-title="" title=""><br><br>#}
    {#</div>#}


    {#<div class="panel panel-default corner-radius" style="color:#a5a5a5">#}
    {#<div class="panel-body text-center">#}
    {#<a href="http://estgroupe.com/" style="color:#a5a5a5">#}
    {#<img src="https://dn-phphub.qbox.me/uploads/images/201612/12/1/iq7WQc2iuW.png" style="width: 20px;margin-right: 4px;margin-top: -4px;"><span style="margin-top: 7px;display: inline-block;">#}
    {#优帆远扬 - 创造不息，交付不止#}
    {#</span>#}
    {#</a>#}
    {#</div>#}

    {#</div>#}

</div>