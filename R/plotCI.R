
plotCI <- function (x, y = NULL, uiw, liw = uiw, ..., col="black", ylim,
                    barcol=col, sfrac = 0.01, gap=1, labels=F, barwidth=1,
                    add=F) { 
  if (is.list(x)) { 
    y <- x$y 
    x <- x$x 
  } 
  if (is.null(y)) { 
    if (is.null(x)) 
      stop("both x and y NULL") 
    y <- as.numeric(x) 
    x <- seq(along = x) 
  }

  if(gap!=F)
    gap <- strheight("O") * gap
  
  ui.top <- y + uiw
  ui.bot <- ifelse( y + gap < ui.top, y + gap, ui.top)
  li.bot <- y - liw
  li.top <- ifelse( y - gap > li.bot, y - gap, li.bot)

  if(missing(ylim))
    {
      ylim  <- range(c(y, ui.top, ui.bot, li.top, li.bot),na.rm=T)
    }

  if(!add)
    {
      if(missing(labels) || labels==F )
        plot(x, y, ylim = ylim, col=col, ...)
      else
        {
          plot(x, y, ylim = ylim, col=col, type="n", ...)
          text(x, y, label=labels, col=col )
        }
    }

 
  smidge <- diff(par("usr")[1:2]) * sfrac * barwidth
  if(liw>0)
    {
      segments(x, li.top, x, li.bot, col=barcol, lwd=barwidth)
      segments(x - smidge, li.bot, x + smidge, li.bot, col=barcol)
    }


  if(uiw>0)
    {
      segments(x, ui.top, x, ui.bot, col=barcol, lwd=barwidth)
      segments(x - smidge, ui.top, x + smidge, ui.top, col=barcol)
    }

invisible(list(x = x, y = y)) 
} 
