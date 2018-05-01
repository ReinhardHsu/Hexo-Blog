<!-- VL BEGIN -->
<script src="//cdn1.lncld.net/static/js/3.0.4/av-min.js"></script>
<script src='//unpkg.com/valine/dist/Valine.min.js'></script>
<script type="text/javascript">
new Valine({
    el: '#uyan_frame' ,
    notify:false, 
    verify:false, 
    appId: '{{ config.valine_appid || theme.valine_appid }}',
    appKey: '{{ config.valine_appkey || theme.valine_appkey }}',
    placeholder: 'just go go',
    path:window.location.pathname, 
    avatar:'mm' 
});
</script>
<!-- VL END -->