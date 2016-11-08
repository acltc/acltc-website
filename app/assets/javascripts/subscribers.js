$(function() {
  $("#subscribers-index-table th a, #subscribers-index-table .pagination a").on("click", function() {
    $.getScript(this.href);
    return false;
  });
  $("#subscribers-index-search input").keyup(function() {
    $.get($("#subscribers-index-search").attr("action"), $("#subscribers-index-search").serialize(), null, "script");
    return false;
  });
});
