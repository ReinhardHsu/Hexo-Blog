</script>
<!-- Global Site Tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id={{ config.google_analytics || theme.google_analytics }}"></script>
<script>
if(isTriggerAnalytics) {
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', '{{ config.google_analytics || theme.google_analytics }}');
 }
</script>