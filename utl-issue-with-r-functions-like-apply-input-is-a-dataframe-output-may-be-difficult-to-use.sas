%let pgm=utl-issue-with-r-functions-like-apply-input-is-a-dataframe-output-may-be-difficult-to-use;

Issue with r functions like apply input is a dataframe output may be difficult to use

This does not mean you should avoid apply functions or other r functions. however beware.
Worse in python.

github
https://tinyurl.com/ys32m6nn
https://github.com/rogerjdeangelis/utl-issue-with-r-functions-like-apply-input-is-a-dataframe-output-may-be-difficult-to-use

SOAPBOX ON

R users seem to demand performance and avoid loops, but for most problems performance is not an issue?
Loops ar more flexible, readable, maintainable and provide ouput that can be used by other languages.

THE BIGGEST ISSUE WITH R APPLY FUNCTIONS IS THIS.
=================================================

If I input a dataframe to apply I do not get a dataframe back.
In fact the outputs can be very hard to use and integrate with other languages, less is more.
A list of dataframes is ok output for more complex r packages, like SAS?
Even worse in python

The solution for some problems maybe to substitute loops and avoid apply.

CONSIDER THIS
=============

In order for me to use the output of apply in the r script below I need to post process.

 coltot <- apply(have,2,sum)  (output is nasty named numbers)

   1. coltot<-as.data.frame(coltot)    * I need a dataframe
   2. rownames(coltotal) <- NULL       * Remove pesky rownames (not useful in most languages, and cause downstream problems?)
   3. colnames(coltotal)<-c("coltot")  * I need a single dataframe column of sums with name coltot (not coltotal)


options validvarname=upcase;
libname sd1 "d:/sd1";
data sd1.have;
 input x1-x3;
cards4;
1 4 7
2 5 8
3 6 9
;;;;
run;quit;

%utl_rbeginx;
parmcards4;
library(haven)
have<-read_sas("d:/sd1/have.sas7bdat")
print(have)
#  X1    X2    X3
#
#   1     4     7
#   2     5     8
#   3     6     9

coltotal <- apply(have,2,sum)
str(coltotal)

# Named num [1:3] 6 15 24
# - attr(*, "names")= chr [1:3] "X1" "X2" "X3"
# named numbers can cause all sorts of problems intergating with other languages

# lets transform to a dataframe, which is what apply should have created
coltotal<-as.data.frame(coltotal)
str(coltotal)
coltotal

# rownames can also case issues so lets get rid of rowname
# data.frame:3 obs. of  1 variable:
#  $ coltot: num  6 15 24
# > coltot
#    coltot
# X1      6
# X2     15
# X3     24

# finally this is what I want
rownames(coltotal) <- NULL
colnames(coltotal)<-c("coltot")
str(coltotal)
coltotal

# coltot
#      6
#     15
#     24

;;;;
%utl_rendx;

SOAPBOX OFF;

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
