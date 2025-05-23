\name{GaltonFamilies}
\alias{GaltonFamilies}
\docType{data}
\title{
Galton's data on the heights of parents and their children, by child
}
\description{
This data set lists the individual observations for 934 children in 205 families
on which Galton (1886) based his cross-tabulation. 

In addition to the question of the relation between heights of parents and their offspring,
for which this data is mainly famous, Galton had another purpose which the
data in this form allows to address:
Does marriage selection indicate a relationship between the heights of husbands and
wives, a topic he called \emph{assortative mating}?
Keen [p. 297-298](2010) provides a brief discussion of this topic.

}
\usage{data(GaltonFamilies)}
\format{
  A data frame with 934 observations on the following 8 variables.
  \describe{
    \item{\code{family}}{family ID, a factor with levels \code{001}-\code{204}}
    \item{\code{father}}{height of father}
    \item{\code{mother}}{height of mother}
    \item{\code{midparentHeight}}{mid-parent height, calculated as \code{(father + 1.08*mother)/2}}
    \item{\code{children}}{number of children in this family}
    \item{\code{childNum}}{number of this child within family. Children are listed in decreasing order
      of height for boys followed by girls}
    \item{\code{gender}}{child gender, a factor with levels \code{female} \code{male}}
    \item{\code{childHeight}}{height of child}
  }
}
\details{
Galton's notebook lists 963 children in 205 families ranging from 1-15 adult children children.
Of these, 29 had non-numeric heights recorded and are not included here.

Families are largely listed in descending order of fathers and mothers height.
}
\source{
Galton's notebook,
\url{http://www.medicine.mcgill.ca/epidemiology/hanley/galton/notebook/},
transcribed by Beverley Shipley in 2001.
}
\references{
Galton, F. (1886). Regression Towards Mediocrity in Hereditary Stature
 \emph{Journal of the Anthropological Institute}, 15, 246-263

Hanley, J. A. (2004). "Transmuting" Women into Men: Galton's Family Data on Human Stature.
\emph{The American Statistician}, 58, 237-243.
See: \url{http://www.medicine.mcgill.ca/epidemiology/hanley/galton/} for source materials.

Keen, K. J. (2010). \emph{Graphics for Statistics and Data Analysis with R}, 
Boca Raton: CRC Press,
\url{https://www.unbc.ca/keen/textbook}. 



}

\seealso{
	\code{\link{Galton}},
	\code{\link{PearsonLee}}
	}

\examples{
data(GaltonFamilies)
str(GaltonFamilies)

## reproduce Fig 2 in Hanley (2004)
library(car)
scatterplot(childHeight ~ midparentHeight | gender, data=GaltonFamilies, 
    ellipse=TRUE, levels=0.68, legend.coords=list(x=64, y=78))

# multiply daughters' heights by 1.08
GF1 <- within(GaltonFamilies, 
              {childHeight <- ifelse (gender=="female", 1.08*childHeight, childHeight)} )
scatterplot(childHeight ~ midparentHeight | gender, data=GF1, 
    ellipse=TRUE, levels=0.68, legend.coords=list(x=64, y=78))

# add 5.2 to daughters' heights 
GF2 <- within(GaltonFamilies, 
              {childHeight <- ifelse (gender=="female", childHeight+5.2, childHeight)} )
scatterplot(childHeight ~ midparentHeight | gender, data=GF2, 
    ellipse=TRUE, levels=0.68, legend.coords=list(x=64, y=78))

#########################################
# relationship between heights of parents
#########################################

Parents <- subset(GaltonFamilies, !duplicated(GaltonFamilies$family))

with(Parents, {
  sunflowerplot(mother, father, rotate=TRUE, pch=16, 
     xlab="Mother height", ylab="Father height")
	dataEllipse(mother, father, add=TRUE, plot.points=FALSE, 
     center.pch=NULL, levels=0.68)
	abline(lm(father ~ mother), col="red", lwd=2)
	}
	)

}
\keyword{datasets}
