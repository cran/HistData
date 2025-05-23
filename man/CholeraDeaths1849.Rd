\name{CholeraDeaths1849}
\alias{CholeraDeaths1849}
\docType{data}
\title{
Daily Deaths from Cholera and Diarrhaea in England, 1849
}
\description{
Deaths from Cholera and Diarrhaea, for each day of the month of each of the 12 months of 1849.

This was used by William Farr (GRO & Farr, 1852, Plate 2) to produce a time series chart of these deaths,
in which he also recorded various meteorological phenomena (barometer, wind, rain),
to see if he could find any patterns. This chart is available on the web site
for Friendly & Wainer (2021) as Fig 4.1, \url{https://friendly.github.io/HistDataVis/figs-web/04_1-cholera-diarrhea.png}.

James Riley (2023) notes, "Cholera 1849 has special significance --- it is likely to be one of few modern pandemics that was completely unmitigated."

}
\usage{data("CholeraDeaths1849")}
\format{
  A data frame with 730 observations on the following 6 variables.
  \describe{
    \item{\code{month}}{a character vector}
    \item{\code{cause_of_death}}{a factor with levels \code{Cholera} \code{Diarrhaea}}
    \item{\code{day_of_month}}{a character vector}
    \item{\code{deaths}}{a numeric vector}
    \item{\code{date}}{a Date}
    \item{\code{day_of_week}}{an ordered factor with levels \code{Mon} < \code{Tue} < \code{Wed} < \code{Thu} < \code{Fri} < \code{Sat} < \code{Sun}}
  }
}
\details{
The data set was transcribed by James Riley to a spreadsheet, \url{https://github.com/jimr1603/1849-cholera}.
He notes, "the scan at Internet Archive has a fold on day 11. I have derived this column from the row totals."
}
\source{
The original source is:
General Register Office, William Farr (1852), \emph{Report on the Mortality of Cholera in England, 1848-49}. London: Printed by W. Clowes, for HMSO; scanned by the Internet Archive from the collection of King's College London
and available at \url{https://archive.org/details/b21308251/page/20/mode/2up}.
}

\seealso{\code{\link{Cholera}}, \code{\link{Snow.deaths}}}

\references{
Friendly, M. & Wainer, H. (2021). 
\emph{A History of Data Visualization and Graphic Communication},
Harvard University Press.
% \url{https://www.hup.harvard.edu/catalog.php?isbn=9780674975231}.

Riley, J. (2023). "Cholera in Victorian England", blog post,
\url{https://openor.blog/2023/07/27/cholera-in-victorian-england/}.
}

\examples{
data(CholeraDeaths1849)
str(CholeraDeaths1849)

# Reproduce Farr's (1852) plate 2
library(ggplot2)
CholeraDeaths1849  |>
  ggplot(aes(x = date, y = deaths, colour = cause_of_death)) +
  geom_line(linewidth = 1.2) +
  theme_bw(base_size = 14) +
  theme(legend.position = "top")

}
\keyword{datasets}
