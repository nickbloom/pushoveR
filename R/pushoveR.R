#' An R interface for Pushover.
#'
#' Lets you send Pushover messages from R.
#' 
#' This package provides an R-based interface for Pushover. In order to use it, you'll need to register for Pushover, and apply for a 'script' apikey at \href{https://pushover.net/api}{here}. If you'd like, you can create a JSON file called "pushoverinfo.json" in your home directory (or your default working directory on Windows). To get a template for the config file, go \href{here}{https://github.com/nicholasbloom/pushoveR}. Otherwise you'll have to enter everything manually.
#' 
#' @name pushoveR
#' @param message Your message as a string
#' @param title Your title as a string (optional, if not provided defaults to "RStudio")
#' @param apikey Your Pushover API key (used automatically with a config file)
#' @param userkey Your Pushover user key (used automatically with a config file)
#' @param device Which pushover device do you want to send to? (defaults to first device in config file list)
#' @return Standard http response, and a Pushover message on the selected device.
#' @examples
#' pushoveR('My long process is done!')
#' pushoveR('This is my message',title='Awesome Title!')

require('RJSONIO')
require('RCurl')
pbinfo <- tryCatch({
  if(.Platform$OS.type=='unix'){
    RJSONIO::fromJSON('~/pushoverinfo.json')
  } else{
    wd = getwd()
    RJSONIO::fromJSON(paste(wd,'pushoverinfo.json',sep='/'))}
  }, error=function(cond) {
  message("Note: I don't see a config file, you'll have to pass everything manually")}

)
pushoveR <- function(message,title,apikey=pbinfo$apikey,userkey=pbinfo$userkey,device=pbinfo$devices[1]){
  if(missing(message)){
    stop("You didn't give a message to send!")
  }else if(missing(title)){
  postForm('https://api.pushover.net/1/messages.json',
           token = apikey,
           user = userkey,
           title='RStudio',
           device = device,
           message = message)
} else{
  postForm('https://api.pushover.net/1/messages.json',
           token = apikey,
           user = userkey,
           device = device,
           title = title,
           message = message)

}

}
