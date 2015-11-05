$(document).ready ->
  $headerContainer = $(".header-container")
  if $headerContainer.length > 0
    $headerContainer.find("a").click (e) ->
      e.preventDefault()
      $("html, body").animate({
        scrollTop: $("nav").offset().top
      }, 600)
      return false

    $headerContainer.css("height", $(window).height())
    $headerContainer.backstretch($headerContainer.data("image"))
