$(document).on "click", (e) ->
  if $(".pages-home").length > 0
    unless $(e.target).attr("href")
      e.preventDefault()
      location.href = $("#first-page").data("path")
      return false
