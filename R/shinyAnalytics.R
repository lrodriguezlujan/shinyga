.onAttach <- function(...) {
  shiny::addResourcePath('shinyga', system.file('www', package = 'shinyga'))
}

#' @title Set up a shiny app to use Google Analytics
#'
#' @description This function must be called from the app's UI to
#' enable tracking
#'
#' @export
useGoogleAnalytics <- function(...){

  # Shinyjs and tracking
  return(
    shiny::tagList(
      # Enable ShinyJS
      shinyjs::useShinyjs(...),
      # GA script
      shiny::tags$script(src="shinyga/js/google-analytics.js", type = "text/javascript"),
      # wrapper GA function
      shinyjs::extendShinyjs(text =
                               "shinyjs.ga = function(op, type,cat,action,label,value, op){
                              ga(op, type,cat,action,label,value)
                            }" )
    )
  )
}

#' @title Enable GA tracking
#'
#' @description This function must be called at the begining of the app's server code. It calls
#' \code{ga(create, trackingID, auto)}
#'
#' @param trackingID Unique website tracking ID given by Google analytics
#'
#' @export
enableTracking <- function(trackingID){
  js$ga("create",trackingID,"auto")
}

#' @title Record a page view
#'
#' @description Executes \code{ga(send, pageview)}. \link{enableTracking} Must be called before
#'
#' @export
recordPageView <- function(){
  js$ga("send","pageview")
}

#' @title Input tracking
#'
#' @description Sends an event with given category, action and label whenever
#' the given input changes. This function must be called in the app's server side.
#'
#' @param inputId Input unique ID string
#' @param input Shiny server reactive input value
#' @param category Event category
#' @param action Event action
#' @param label Event label
#'
#' @export
gaTrack <- function(inputId, session, category, action, label = inputId){
  shiny::observeEvent(session$input[[inputId]],{
    js$ga("send","event",category,action,label,session$input[[inputId]])
  }, domain = session)
}

