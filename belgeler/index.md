# Türkçe Yazım Denetimi / Turkish Spelling Checker

<div id="lang-redirect" style="text-align:center; padding: 40px 20px;">

<p style="font-size: 1.1em; color: #666;">Yönlendiriliyor / Redirecting...</p>

<p style="margin-top: 30px;">
<a href="tr/" class="md-button md-button--primary">🇹🇷 Türkçe</a>
&nbsp;&nbsp;
<a href="en/" class="md-button">🇬🇧 English</a>
</p>

</div>

<script>
(function() {
  var lang = (navigator.language || navigator.userLanguage || '').toLowerCase();
  var base = window.location.pathname.replace(/\/+$/, '');
  if (lang.startsWith('tr')) {
    window.location.replace(base + '/tr/');
  } else {
    window.location.replace(base + '/en/');
  }
})();
</script>
