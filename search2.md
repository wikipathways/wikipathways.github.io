---
title: Search Results 2
---
<script src="/assets/js/simple-jekyll-search-ap.js"></script> 

<script>
  var div = document.getElementById("navbarNavAltMarkup");
  div.classList.add("show");
  //hide search widget
  document.getElementById("search-widget").style.display = "none";
</script>

<div class="search">
  <i class="fa fa-search" aria-hidden="true"></i>
  <input type="text" id="search-input" placeholder=" e.g., ACE or cancer">
  <ul id="results-container" style="list-style:none;"></ul>
</div>

<script>
SimpleJekyllSearch({
  searchInput: document.getElementById('search-input'),
  resultsContainer: document.getElementById('results-container'),
  json: '/search.json',
  searchResultTemplate: '<table style="border-style:none; padding:0px; margin:0px;"><tr> ' +
        '<td style="width:160px;border-style:none;"><a style="text-decoration:none;" href="{url}" ' + 
        'target="_blank"><img alt="Pathway thumbnail" ' +
         'src="/assets/img/{wpid}/{wpid}-thumb.png"/></a></td>' +
         '<td style="border-style:none;"><a style="font-size:16px;text-decoration:none;color:#1A0DAB;" href="{url}" ' +
         'target="_blank">{title}</a>' +
         '<br/><span style="color:#777777;">{wpid} - {organisms}</span>' +
        '<br/><span style="font-size:13px;">{description}</span>' +
        '<br/><span style="color:#777777;"><i>Last edited: {last-edited}</i></span>' +
        '</td></tr></table>',
  noResultsText: 'No results found',
  limit: 20,
  fuzzy: false,
  exclude: ['url']
})
</script>