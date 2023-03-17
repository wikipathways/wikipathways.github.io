---
title: Search Results
---
<script>
  let hasInputListener = false;
</script>
<script src="/assets/js/simple-jekyll-search-ap.js"></script> 

<script>
  var div = document.getElementById("navbarNavAltMarkup");
  div.classList.add("show");
  //hide search widget
  document.getElementById("search-widget").style.display = "none";
</script>

<div class="alert alert-primary" role="alert">
  <span title="pro-tip" >
    <i class="fa fa-circle-info"></i>
  </span>
  <i>Pro-tip:</i> Start typing any keywords for pathway titles, descriptions, genes or metabolites and the first 40 results will appear. You can include organisms, ontology annotations, WPIDs, and even last-edited dates in your query. Multi-term queries are processed as AND queries.
</div> 

<div class="search">
  <i class="fa fa-search" aria-hidden="true"></i>
  <input type="text" id="search-input" placeholder="&nbsp;Start typing your query terms here...">
  <span style="font-size: small;">Examples: 
  <a href="search.html?query=ace2 aldosterone human">ACE2 aldosterone human</a> |  
  <a href="search.html?query=stem cell">stem cell</a> |  
  <a href="search.html?query=drosophila">drosophila</a> |  
  <a href="search.html?query=cancer 2023">cancer 2023</a> |  
  <a href="search.html?query=wp554">WP554</a></span>
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
  limit: 40,
  fuzzy: false,
  exclude: ['url'],
  sortMiddleware: function(a, b) {
    const aNum = parseInt(a.wpid.match(/\d+/)[0]);
    const bNum = parseInt(b.wpid.match(/\d+/)[0]);
    return bNum - aNum;
  }
})
</script>
<script>
function triggerInputEvent() {
  //AP: Support multiple searchboxes and query params
  const searchInput = document.getElementById('search-input')
  const searchParams = new URLSearchParams(window.location.search);
  const query = searchParams.get('query');
  const registerInputPromise = new Promise((resolve) => {
    if (hasInputListener) {
      resolve();
    } else {
      const intervalId = setInterval(() => {
        if (hasInputListener) {
          //console.log("now!")
          clearInterval(intervalId);
          resolve();
        } else {
          //console.log("not yet...")
        }
      }, 100);
    }
  });
  registerInputPromise.then(() => {
    //console.log(query);
    searchInput.value = query; 
    const inputEvent = new InputEvent('input', { inputType: 'insertText' });
    searchInput.dispatchEvent(inputEvent);
  });
}
triggerInputEvent();
</script>